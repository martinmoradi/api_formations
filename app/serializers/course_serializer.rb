class CourseSerializer
  include JSONAPI::Serializer
  attributes :id, :title

  attribute :teacher do |object|
    "#{object.teacher.first_name} #{object.teacher.last_name}"
  end

  attribute :teacher_email do |object|
    object.teacher.email
  end

  attribute :categories do |object|
    object.categories.each do |category|
    end
  end

  attribute :sessions do |object|
    object.course_sessions.each do |session|
      session.classroom.room_location
    end
  end
end
