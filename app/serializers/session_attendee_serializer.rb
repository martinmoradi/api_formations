class SessionAttendeeSerializer
  include JSONAPI::Serializer
  attributes :assessment, :course_session

  attribute :student do |object|
    "#{object.student.first_name} #{object.student.last_name}"
  end
end
