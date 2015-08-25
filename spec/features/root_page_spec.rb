require 'rails_helper'

RSpec.describe 'Root', type: :feature, js: true do
  context 'shows' do
    before { visit root_path }
    it 'correct title' do
      expect(page.title).to eq(I18n.t('title'))
    end

    it 'Login form' do
      expect(page).to have_text('Log in')
    end
  end
end
