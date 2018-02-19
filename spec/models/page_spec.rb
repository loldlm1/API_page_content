require 'rails_helper'

RSpec.describe Page, type: :model do
  let(:page) { FactoryBot.create(:page) }

  describe 'fields' do
    it { is_expected.to respond_to(:content) }
  end
end
