require 'faker'

100.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    role: %w[student teacher admin].sample,
    is_validated: true
  )
end
puts 'Users created'

50.times do
  Course.create!(
    title: Faker::Company.industry,
    teacher_id: User.teachers.sample.id
  )
end
puts 'Courses created'

30.times do
  Category.create!(
    title: Faker::Company.profession
  )
end
puts 'Categories created'

Course.all.each do |item|
  CourseCategoryAssignment.create!(
    course_id: item.id,
    category_id: Category.all.sample.id
  )
end
puts 'Categories Assigments created'

20.times do
  Classroom.create!(
    room_location: Faker::Alphanumeric.alphanumeric(number: 2)
  )
end
puts 'Classrooms created'

50.times do
  CourseSession.create!(
    date: Faker::Date.in_date_period,
    classroom_id: Classroom.all.sample.id,
    course_id: Course.all.sample.id
  )
end
puts 'Sessions created'

CourseSession.all.each do |item|
  students = User.students
  used_students = []
  rand(20).times do
    student = students.sample
    next if used_students.include?(student) do
              SessionAttendee.create!(
                assessment: rand(20),
                student_id: student.id,
                course_session_id: item.id
              )
              used_students << student
            end
  end
end
puts 'Session attendees created'
