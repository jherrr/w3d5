# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

1000.times do
  User.create!(fname: Faker::Name.first_name, lname: Faker::Name.last_name)
end

100.times do
  Poll.create!(title: Faker::Company.name,author_id: rand(1000))
end

1000.times do
  Question.create!(poll_id: rand(100), body: Faker::Code.isbn)
end

2000.times do |i|
  AnswerChoice.create!(question_id: i / 2, body: Faker::SlackEmoji.nature)
end

2000.times do
  Response.create!(respondent_id: rand(1000), answer_choice_id: rand(2000))
end
