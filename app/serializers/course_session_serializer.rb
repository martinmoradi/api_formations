class CourseSessionSerializer
  include JSONAPI::Serializer
  attributes :date, :course, :students
  has_one :classroom
end
