require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#valid?" do
    subject(:user) { FactoryBot.build_stubbed(:user) }

    context "情報が正しいとき" do
      it { is_expected.to be_valid }
    end

    context "nameが空のとき" do
      before do
        user.name = " "
      end
      it { is_expected.to_not be_valid }
    end

    context "nameの文字数が2文字以下のとき" do
      before do
        user.name = "x"
      end
      it { is_expected.to_not be_valid }
    end

    context "nameの文字数が25文字以上のとき" do
      before do
        user.name = "x" * 26
      end
      it { is_expected.to_not be_valid }
    end

    context "同じnameのユーザがいたとき" do
      before do
        FactoryBot.create(:user)
        user.email = "other@example.com"
      end
      it { is_expected.to_not be_valid }
    end

    context "emailが空のとき" do
      before do
        user.email = " "
      end
      it { is_expected.to_not be_valid }
    end

    context "emailの文字数が250文字以上のとき" do
      before do
        user.email = "x" * 250 + "@example.com"
      end
      it { is_expected.to_not be_valid }
    end

    context "emailが登録済みのとき" do
      before do
        FactoryBot.create(:user)
        user.name = "other"
      end
      it { is_expected.to_not be_valid }
    end

    context "emailが不正なとき" do
      it {
        user.email = "user@example,com"
        is_expected.to_not be_valid
      }
      it {
        user.email = "user_at_foo.org"
        is_expected.to_not be_valid
      }
      it {
        user.email = "user.name@example."
        is_expected.to_not be_valid
      }
      it {
        user.email = "foo@bar..com"
        is_expected.to_not be_valid
      }
    end

    context "emailが小文字で登録されているか" do
      let(:email) { user.email.upcase! }
      let(:saved_user) { FactoryBot.create(:user) }
      it { expect(saved_user.reload.email).to eq user.email.downcase }
    end
  end
end
