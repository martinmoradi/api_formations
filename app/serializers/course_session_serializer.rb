class CourseSessionSerializer
  include JSONAPI::Serializer
  attributes :date, :remaining_seats, :students, :classroom

  attribute :room_location do |object|
    object.classroom.room_location
  end
end
