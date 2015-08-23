require 'rails_helper'

RSpec.describe 'Root', type: :feature, js: true do
  context 'shows' do
    it 'Home#index' do
      visit root_path
      expect(page).to have_text('Home')
    end
  end
end
