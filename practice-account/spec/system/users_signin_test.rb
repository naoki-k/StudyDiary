require 'rails_helper'

RSpec.describe "SignIn", type: :system do

  let(:user) { FactoryBot.create(:user) }

  context "サインインが成功したとき" do
    it :aggregate_failures do
      visit :signin
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_button 'sign in'
      expect(page.body).to have_selector 'div.alert', text: 'Welcome back,'
      expect(page.body).to have_link 'Sign up'
      expect(page.body).to have_link 'Sign out'
    end
  end

  context "サインインが失敗したとき" do
    it :aggregate_failures do
      visit :signin
      click_button 'sign in'
      expect(page.body).to have_selector 'div.alert', text: 'Invalid email or password...'
      expect(page.body).to have_button 'sign in'
    end
  end
end
