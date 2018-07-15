FactoryBot.define do
  factory :answer_upvote do
    user nil
    answer nil
  end
  factory :question_upvote do
    user nil
    question nil
  end
  factory :answer do
    user nil
    question nil
    content "MyString"
  end
  factory :user do
    email FFaker::Internet.email
    password '123456'
    name FFaker::Name.html_safe_last_name
  end
end