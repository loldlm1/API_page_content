require 'rails_helper'

RSpec.describe Page, type: :model do
  let(:page) { FactoryBot.build(:page) }

  describe 'fields' do
    it { is_expected.to respond_to(:content) }
    it { is_expected.to respond_to(:url) }
  end

  describe '#url' do
    it { should_not allow_value("test").for(:url) }
    it { should allow_value("www.test.com").for(:url) }
  end

  describe '#parse_content' do
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

    it 'parse the html content before it saves' do
      page = Page.new(url: 'www.test.com')
      page.save
      content_hash = { 'h1' => ['hello'], 'h2' => ['world'], 'h3' => ['!!'], 'a' => ['click here'] }

      expect(page.content).to eq content_hash
    end
  end
end
