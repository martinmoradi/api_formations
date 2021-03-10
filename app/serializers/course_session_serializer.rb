class CourseSessionSerializer
  include JSONAPI::Serializer
  attributes :date, :remaining_seats, :students, :classroom
end
