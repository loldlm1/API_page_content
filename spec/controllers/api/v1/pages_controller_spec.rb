require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.resource 'Pages' do
  header 'Content-Type', 'application/json'
  before do
    allow(RestClient).to receive(:get).and_return(
      %{
        <h1>hello</h1>
        <h2>world</h2>
        <h3>!!</h3>
        <a>click here</a>
      }
    )
  end

  post 'api/v1/pages' do
    parameter :url, 'url'
    let(:url) { 'www.testweb.com' }
    let(:raw_post) { params.to_json }
    let(:content_hash) {
      { 'h1': ['hello'], 'h2': ['world'], 'h3': ['!!'], 'a': ['click here'] }
    }

    example 'Getting the page parsed' do
      do_request

      expect(status).to eq(200)
      fetched_page = JSON.parse(response_body, symbolize_names: true)
      expect(fetched_page[0][:url]).to eq 'www.testweb.com'
      expect(fetched_page[0][:content]).to eq content_hash
    end
  end

  get '/api/v1/pages' do
    let(:content_html_1) {
      {
        h1: ['a'],
        h2: ['b'],
        h3: ['c'],
        link: ['click here']
      }
    }
    let(:content_html_2) {
      {
        h1: ['title'],
        h2: ['rails'],
        h3: ['5.0'],
        link: ['click here']
      }
    }
    let!(:page_1) { FactoryBot.create(:page) }
    let!(:page_2) { FactoryBot.create(:page, url: 'test2.com.ve') }

    before do
      page_1.update(content: content_html_1)
      page_2.update(content: content_html_2)
    end

    example 'Getting all the pages with its content' do
      do_request

      expect(status).to eq(200)
      fetched_user = JSON.parse(response_body, symbolize_names: true)
      expect(fetched_user[0][:url]).to eq 'www.google.com'
      expect(fetched_user[0][:content]).to eq content_html_1
      expect(fetched_user[1][:url]).to eq 'test2.com.ve'
      expect(fetched_user[1][:content]).to eq content_html_2
    end
  end
end
