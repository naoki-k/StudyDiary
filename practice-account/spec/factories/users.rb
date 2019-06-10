FactoryBot.define do
  factory :user do
    name { "sample name" }
    email { "sample@email.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
