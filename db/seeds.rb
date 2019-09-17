# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
thumbnail = Faker::Avatar.image(slug: "my-own-slug", size: "50x50")
description = Faker::Lorem.paragraph
n = rand(2..10)

User.create!(full_name: "Truong Van Lam",
  email: "truong.van.lam@sun-asterisk.com",
  password: "123456",
  password_confirmation: "123456",
  address: "Thua Thien Hue",
  phone: "123456789",
  avatar: "",
  role: 1,
  activated: true,
  activated_at: Time.zone.now)

#trainer
User.create!(full_name: "Trainer 1",
  email: "trainer-1@sun-asterisk.com",
  password: "123456",
  password_confirmation: "123456",
  address: "Thua Thien Hue",
  phone: "123456789",
  avatar: "",
  role: 2,
  activated: true,
  activated_at: Time.zone.now)

User.create!(full_name: "Trainer 2",
  email: "trainer-2@sun-asterisk.com",
  password: "123456",
  password_confirmation: "123456",
  address: "Thua Thien Hue",
  phone: "123456789",
  avatar: "aa",
  role: 2,
  activated: true,
  activated_at: Time.zone.now)

#traine
User.create!(full_name: "traine 1",
  email: "traine-1@sun-asterisk.com",
  password: "123456",
  password_confirmation: "123456",
  address: "Thua Thien Hue",
  phone: "123456789",
  avatar: "aa",
  role: 3,
  activated: true,
  activated_at: Time.zone.now)

User.create!(full_name: "traine-2",
  email: "traine-2@sun-asterisk.com",
  password: "123456",
  password_confirmation: "123456",
  address: "Thua Thien Hue",
  phone: "123456789",
  avatar: "aa",
  role: 3,
  activated: true,
  activated_at: Time.zone.now)

User.create!(full_name: "traine-3",
  email: "traine-3@sun-asterisk.com",
  password: "123456",
  password_confirmation: "123456",
  address: "Thua Thien Hue",
  phone: "123456789",
  avatar: "aa",
  role: 3,
  activated: true,
  activated_at: Time.zone.now)

# courses
Course.create!( name: "Ruby",
  thumbnail: thumbnail,
  description: description,
  time_start: Time.zone.now,
  time_end: Time.zone.now + n.weeks,
  status: 1,
  creator_id: 2
  )

Course.create!( name: "PHP",
  thumbnail: thumbnail,
  description: description,
  time_start: Time.zone.now,
  time_end: Time.zone.now + n.weeks,
  status: 1,
  creator_id: 3
  )

Course.create!( name: "Javascript",
  thumbnail: thumbnail,
  description: description,
  time_start: Time.zone.now,
  time_end: Time.zone.now + n.weeks,
  status: 1,
  creator_id: 2
  )

#seed subjects
Subject.create!( name:  "Git tutorial",
  thumbnail: thumbnail,
  description: description,
  day_learn: 5,
  creator_id: 2,
  )

Subject.create!( name:  "Ruby basic",
  thumbnail: thumbnail,
  description: description,
  day_learn: 10,
  creator_id: 2,
  )

Subject.create!( name:  "Rails",
  thumbnail: thumbnail,
  description: description,
  day_learn: 15,
  creator_id: 2,
  )

Subject.create!( name:  "Php Basic",
  thumbnail: thumbnail,
  description: description,
  day_learn: 7,
  creator_id: 3,
  )

Subject.create!( name:  "Javacript basic",
  thumbnail: thumbnail,
  description: description,
  day_learn: 6,
  creator_id: 3,
  )

# create seed course_subject
CourseSubject.create!(
  course_id: 1,
  subject_id: 1,
  order: 1
  )

CourseSubject.create!(
  course_id: 1,
  subject_id: 2,
  order: 2
  )

CourseSubject.create!(
  course_id: 1,
  subject_id: 3,
  order: 3
  )

CourseSubject.create!(
  course_id: 2,
  subject_id: 1,
  order: 1
  )

CourseSubject.create!(
  course_id: 2,
  subject_id: 3,
  order: 2
  )

CourseSubject.create!(
  course_id: 3,
  subject_id: 4,
  order: 1
  )

CourseSubject.create!(
  course_id: 3,
  subject_id: 5,
  order: 2
  )

#creat seed  management_course
CourseManagement.create!(
  time_join: Time.zone.now + n.weeks,
  status: 1,
  course_id: 1,
  user_id: 4
  )

CourseManagement.create!(
  time_join: Time.zone.now + n.weeks,
  status: 2,
  course_id: 2,
  user_id: 4
  )

CourseManagement.create!(
  time_join: Time.zone.now + n.weeks,
  status: 2,
  course_id: 3,
  user_id: 4
  )

CourseManagement.create!(
  time_join: Time.zone.now + n.weeks,
  status: 2,
  course_id: 2,
  user_id: 5
  )

CourseManagement.create!(
  time_join: Time.zone.now + n.weeks,
  status: 2,
  course_id: 1,
  user_id: 5
  )

CourseManagement.create!(
  time_join: Time.zone.now + n.weeks,
  status: 1,
  course_id: 2,
  user_id: 6
  )

CourseManagement.create!(
  time_join: Time.zone.now + n.weeks,
  status: 2,
  course_id: 1,
  user_id: 2
  )

  CourseManagement.create!(
    time_join: Time.zone.now + n.weeks,
    status: 2,
    course_id: 2,
    user_id: 3
    )

CourseManagement.create!(
  time_join: Time.zone.now + n.weeks,
  status: 2,
  course_id: 3,
  user_id: 2
  )
