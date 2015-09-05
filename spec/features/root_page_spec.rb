require 'rails_helper'

RSpec.describe 'Root', type: :feature, js: true do
  context 'shows' do
    before { visit root_path }
    context 'title' do
      subject { page.title }
      it { is_expected.to eq(I18n.t('title')) }
    end

    context 'Login' do
      subject { page }
      it { is_expected.to have_text('Log in') }
    end
  end
end
