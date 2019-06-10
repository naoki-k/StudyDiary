require 'rails_helper'
require 'sessions_helper'

RSpec.describe SessionsController, type: :controller do

  let(:user) { FactoryBot.create(:user) }

  describe "#new" do
    subject { get :new }

    it do
      expect(response).to have_http_status(200)
    end
  end

  describe "#create" do
    subject { post :create, params: { signin: { email: user.email, password: password } } }

    context "サインインが成功したとき" do
      let (:password) { user.password }
      before { subject }

      it :aggregate_failures do
        expect(response).to redirect_to root_path
        expect(flash[:success]).not_to be_empty
      end
    end
  
    context "サインインが失敗したとき" do
      let (:password) { "invalid" }
      before { subject }

      it :aggregate_failures do
        expect(response).to render_template :new
        expect(flash[:danger]).not_to be_empty
      end
    end
  end

  describe "#destroy" do
    include SessionsHelper
      before { sign_in user }
      subject { post :destroy }

    context "サインアウトしたとき" do
      before { subject }

      it :aggregate_failures do
        expect(response).to render_template 'top/index'
        expect(flash[:success]).not_to be_empty
      end
    end
  end
end
