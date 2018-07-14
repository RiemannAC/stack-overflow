FactoryBot.define do
  factory :user do
    email FFaker::Internet.email
    password '123456'
    name FFaker::Name.html_safe_last_name
  end
end