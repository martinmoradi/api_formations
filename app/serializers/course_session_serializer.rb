class CourseSessionSerializer
  include JSONAPI::Serializer
  attributes :date, :remaining_seats

  attribute :room_location do |object|
    object.classroom.room_location
  end

  attribute :course_title do |object|
    object.course.title
  end
end
