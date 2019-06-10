require 'rails_helper'

RSpec.describe "SignUp", type: :system do

  context "アカウント登録が成功したとき" do
    it :aggregate_failures do
      visit :signup
      fill_in 'name', with: 'hogehoge'
      fill_in 'email', with: 'hogehoge@example.com'
      fill_in 'password', with: 'password'
      fill_in 'password confirmation', with: 'password'
      click_button 'sign up'
      expect(page.body).to have_selector 'div.alert', text: 'Nice to meet you,'
      expect(page.body).to have_link 'Sign up'
      expect(page.body).to have_link 'Sign in'
    end
  end

  context "アカウント登録が失敗したとき" do
    it :aggregate_failures do
      visit :signup
      click_button 'sign up'
      expect(page.body).to have_selector 'div.alert', text: 'Something wrong...'
      expect(page.body).to have_selector 'div', text: 'The form contains'
      expect(page.body).to have_button 'sign up'
    end
  end
end
