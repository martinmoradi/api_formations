class CourseSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :teacher, :categories
end
