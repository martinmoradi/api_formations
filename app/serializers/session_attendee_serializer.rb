class SessionAttendeeSerializer
  include JSONAPI::Serializer
  attributes :assessment, :student, :course_session
end
