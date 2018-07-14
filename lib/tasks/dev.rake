namespace :dev do
  task fake_user: :environment do
    User.where.not(role: "admin").destroy_all
    19.times do
      username = FFaker::Name.unique.last_name
      twitter_name = FFaker::Name.last_name
      github_name = FFaker::Name.last_name
      User.create!(
        name: username,
        email: "#{username}@example.com",
        password: "12345678",
        intro: FFaker::Lorem.paragraphs,
        company: FFaker::Company.name,
        title: FFaker::Job.title,
        website: FFaker::Internet.http_url,
        twitter: "https://twitter.com/#{twitter_name}",
        github: "https://github.com/#{github_name}"
      )
    end
    puts "created fake users"
    puts "now you have #{User.count} users data"
  end

  task fake_question: :environment do
    Question.destroy_all

    100.times do
      user = User.all.sample
      question = user.questions.build(
        title: FFaker::Book.unique.author,
        content: FFaker::Book.description,
      )
      question.save
    end
    puts "have created fake questions"
    puts "now you have #{Question.count} questions data"
  end

end