require 'faker'

# Valid users
1000.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    role: %w[student teacher admin].sample,
    is_validated: true
  )
end
puts 'Valid users successfully created '

# Users to validate
15.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    role: %w[student teacher admin].sample,
    is_validated: false
  )
end
puts 'To validate users successfully created'

15.times do
  Course.create!(
    title: Faker::Company.industry,
    teacher_id: User.teachers.sample.id
  )
end
puts 'Courses successfully created'

10.times do
  Category.create!(
    title: Faker::Company.profession
  )
end
puts 'Categories successfully created'

Course.all.each do |item|
  CourseCategoryAssignment.create!(
    course_id: item.id,
    category_id: Category.all.sample.id
  )
end
puts 'Categories Assigments successfully created'

20.times do
  Classroom.create!(
    room_location: Faker::Alphanumeric.alphanumeric(number: 2)
  )
end
puts 'Classrooms successfully created'

10.times do
  CourseSession.create!(
    date: Faker::Date.in_date_period,
    classroom_id: Classroom.all.sample.id,
    course_id: Course.all.sample.id
  )
end
puts 'Sessions successfully created'

CourseSession.all.each do |item|
  used_students_ids = []
  rand(20).times do
    student = User.students.sample
    student = User.students.sample while used_students_ids.include?(student.id)

    SessionAttendee.create!(
      assessment: rand(20),
      student_id: student.id,
      course_session_id: item.id
    )
    used_students_ids << student.id
  end
end
puts 'Session attendees successfully created'
