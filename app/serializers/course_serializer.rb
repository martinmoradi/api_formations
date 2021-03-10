class CourseSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :teacher, :categories, :course_sessions
end
