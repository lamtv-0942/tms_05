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

#seed courses
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

#seed subjects
20.times do |n|
  user_admin = User.where(role: 1).pluck(:id)
  user_trainer = User.where(role: 2).pluck(:id)
  user = user_admin.concat(user_trainer)
  creator_id = user.sample

  courses = Course.pluck(:id)
  course_id = courses.sample

  name  = Faker::Book.title
  description = Faker::Lorem.paragraph
  thumbnail = Faker::Avatar.image(slug: "my-own-slug", size: "50x50")
  n = rand(2..10)
  m = rand(11..20)
  status = rand(1..2)
  Subject.create!( name:  name,
                thumbnail: thumbnail,
                description: description,
                time_start: Time.zone.now + n.weeks,
                time_end: Time.zone.now + m.weeks,
                status: status,
                creator_id: creator_id,
                course_id: course_id
                )
end

#creat seed  management_course
30.times do |n|
  user_traines = User.where(role: 3).pluck(:id)
  user_trainers = User.where(role: 2).pluck(:id)
  user_ids = user_traines.concat(user_trainers)
  user_id = user_ids.sample

  courses = Course.pluck(:id)
  course_id = courses.sample

  n = rand(2..10)
  m = rand(11..20)
  status = rand(1..2)
  activited = ["true","false"].sample
  CourseManagement.create!(
                time_join: Time.zone.now + n.weeks,
                time_leave: Time.zone.now + m.weeks,
                status: status,
                activited: activited,
                course_id: course_id,
                user_id: user_id
                )
end
