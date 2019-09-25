# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(full_name: "Truong Van Lam",
  email: "truong.van.lam@sun-asterisk.com",
  password: "123456",
  password_confirmation: "123456",
  address: "Thua Thien Hue",
  phone: "123456789",
  avatar: "aa",
  role: 1,
  activated: true,
  activated_at: Time.zone.now)

20.times do |n|
  name  = Faker::Name.name
  address = Faker::Address.full_address
  phone = Faker::PhoneNumber.phone_number
  avatar = Faker::Avatar.image(slug: "my-own-slug", size: "50x50")
  email = "example-#{n+1}@railstutorial.org"
  password = "123456"
  role = rand(1..3)
  User.create!( full_name:  name,
                email: email,
                password: password,
                password_confirmation: password,
                address: address,
                phone: phone,
                avatar: avatar,
                role: role,
                activated: true,
                activated_at: Time.zone.now)
end
30.times do
  name = "Ruby"
  description = "A ruby is a pink to blood-red colored gemstone"
  Subject.create!(name: name,
                  description: description,
                  thumbnail: "",
                  time_start: "20/08/2019",
                  time_end: "20/9/2019",
                  status: 1)
end

20.times do |n|
  user_admin = User.where(role: 1).pluck(:id)
  user_trainer = User.where(role: 2).pluck(:id)
  user = user_admin.concat(user_trainer)
  creator_id = user.sample
  name  = Faker::Book.title
  description = Faker::Lorem.paragraph
  thumbnail = Faker::Avatar.image(slug: "my-own-slug", size: "50x50")
  n = rand(2..20)
  status = rand(1..2)
  Course.create!( name:  name,
                thumbnail: thumbnail,
                description: description,
                time_start: Time.zone.now,
                time_end: Time.zone.now + n.weeks,
                status: status,
                creator_id: creator_id
                )
end
