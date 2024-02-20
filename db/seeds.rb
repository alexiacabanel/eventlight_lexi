
# require 'faker'

# 50.times do
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#   description = Faker::Lorem.paragraph(sentence_count: 2)
#   email = Faker::Internet.email(name: "#{first_name}_#{last_name}", domain: 'yopmail.com')
#   password = Faker::Internet.password(min_length: 8)

#   User.create!(
#     first_name: first_name,
#     last_name: last_name,
#     description: description,
#     email: email,
#     encrypted_password: password
#   )
# end

# puts "Seed completed: created 50 users with @yopmail.com email addresses."
