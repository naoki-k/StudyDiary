require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "#new" do
    subject { get :new }

    it do
      expect(response).to have_http_status(200)
    end
  end

  describe "#create" do
    subject { post :create, params: { user: { name: "sample", email: email,
                                      password: "password", password_confirmation: "password" } } }

    context "アカウント登録が成功したとき" do
      let(:email) { "success@example.com" }

      it :aggregate_failures do
        expect{ subject }.to change { User.count }.by(1)
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to root_path
        expect(flash[:success]).not_to be_empty
      end
    end

    context "アカウント登録が失敗したとき" do
      let(:email) { nil }

      it :aggregate_failures do
        expect { subject }.not_to change { User.count }
        expect(response).to render_template :new
        expect(flash[:danger]).not_to be_empty
      end
    end
  end
end
