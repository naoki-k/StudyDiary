require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#valid?" do
    subject(:user) { FactoryBot.build(:user) }

    context "情報が正しいとき" do
      it { is_expected.to be_valid }
    end

    context "nameが空のとき" do
      subject { FactoryBot.build(:user, name: "") }
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

    context "同じ名前のユーザがいたとき" do
      subject { FactoryBot.build(:user, email: "other@example.com") }
      before { FactoryBot.create(:user) }
      it { is_expected.to_not be_valid }
    end

    context "emailが空のとき" do
      subject { FactoryBot.build(:user, email: "") }
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
      let(:valid_user) { [] }
      before do
        valid_user << FactoryBot.build(:user, email: "user@example.com")
        valid_user << FactoryBot.build(:user, email: "USER@foo.COM")
        valid_user << FactoryBot.build(:user, email: "A_US-ER@foo.bar.org")
        valid_user << FactoryBot.build(:user, email: "first.last@foo.jp")
        valid_user << FactoryBot.build(:user, email: "alice+bob@baz.cn")
      end
      it { expect(valid_all valid_user).to be_truthy }
    end

    context "emailが不正なとき" do
      let(:invalid_user) { [] }
      before do
        invalid_user << FactoryBot.build(:user, email: "user@example,com")
        invalid_user << FactoryBot.build(:user, email: "user_at_foo.org")
        invalid_user << FactoryBot.build(:user, email: "user.name@example.")
        invalid_user << FactoryBot.build(:user, email: "foo@bar+baz.com")
        invalid_user << FactoryBot.build(:user, email: "foo@bar..com")
      end
      it { expect(invalid_all invalid_user).to be_truthy }
    end

    context "emailが小文字で登録されているか" do
      let(:case_insencitive_email) { "HogehoGe@Example.COM" }
      let(:user) { FactoryBot.create(:user, email: case_insencitive_email) }
      it { expect(user.email).to eq case_insencitive_email.downcase }
    end
  end
end
