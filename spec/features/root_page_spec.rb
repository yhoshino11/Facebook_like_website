require 'rails_helper'

RSpec.describe 'Root', type: :feature, js: true do
  context 'shows' do
    it 'Login form' do
      visit root_path
      expect(page).to have_text('Log in')
    end
  end
end
