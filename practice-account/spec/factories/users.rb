FactoryBot.define do
  factory :user do
    name { "sample name" }
    email { "sample@email.com" }
    password_digest { User.digest('password') }
  end
end
