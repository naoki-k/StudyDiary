require 'rails_helper'

RSpec.describe "SignUp", type: :system do

  context "アカウント登録のとき" do
    it :aggregate_failures do
      visit :signup
      fill_in 'name', with: 'hogehoge'
      fill_in 'email', with: 'hogehoge@example.com'
      fill_in 'password', with: 'password'
      fill_in 'password confirmation', with: 'password'
      click_button 'sign up'
      expect(page.body).to have_selector 'div.alert', text: 'Account created'
      expect(page.body).to have_link 'Sign up'
    end
  end
end
