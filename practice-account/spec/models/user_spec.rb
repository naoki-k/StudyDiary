require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#valid?" do
    subject(:user) { FactoryBot.build(:user) }

    context "情報が正しいとき" do
      it { is_expected.to be_valid }
    end

    context "nameが空のとき" do
      subject { FactoryBot.build(:user, name: nil) }
      it { is_expected.to_not be_valid }
    end

    context "nameの文字数が2文字以下のとき" do
      subject { FactoryBot.build(:user, name: "x") }
      it { is_expected.to_not be_valid }
    end

    context "nameの文字数が25文字以上のとき" do
      subject { FactoryBot.build(:user, name: "x" * 26) }
      it { is_expected.to_not be_valid }
    end

    context "emailが空のとき" do
      subject { FactoryBot.build(:user, email: nil) }
      it { is_expected.to_not be_valid }
    end

    context "emailの文字数が250文字以上のとき" do
      subject { FactoryBot.build(:user, email: "x" * 250 + "@example.com") }
      it { is_expected.to_not be_valid }
    end

    context "emailが登録済みのとき" do
      subject { FactoryBot.build(:user, name: "other") }
      before { FactoryBot.create(:user) }
      it { is_expected.to_not be_valid }
    end

    context "emailが正しいとき" do
      let(:valid_emails) { %w(user@example.com USER@foo.COM
        A_US-ER@foo.bar.org  first.last@foo.jp alice+bob@baz.cn) }
      it { is_expected.to accept_all(valid_emails).column(:email) }
    end

    context "emailが不正なとき" do
      let(:invalid_emails) { %w( user@example,com user_at_foo.org
        user.name@example. foo@bar+baz.com foo@bar..com ) }
      it { is_expected.to reject_all(invalid_emails).column(:email) }
    end

    context "emailが小文字で登録されているか" do
      let(:case_insencitive_email) { "HogehoGe@Example.COM" }
      let(:user) { FactoryBot.create(:user, email: case_insencitive_email) }
      it { expect(user.email).to eq case_insencitive_email.downcase }
    end

    context "passwordが空のとき" do
      subject { FactoryBot.build(:user, password: nil, password_confirmation: nil) }
      it { is_expected.to_not be_valid }
    end

    context "passwordが6文字より短いとき" do
      subject { FactoryBot.build(:user, password: "hoge", password_confirmation: "hoge") }
      it { is_expected.to_not be_valid}
    end

    context "password_confimationが一致しないとき" do
      subject { FactoryBot.build(:user, password: "hogehoge", password_confirmation: "fugafuga") }
      it { is_expected.to_not be_valid}
    end
  end
end
