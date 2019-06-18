FactoryBot.define do
  factory :user do
    name { "foo@foo.com" }
    email { "123456" }
    password { "123456" }
  end
end
