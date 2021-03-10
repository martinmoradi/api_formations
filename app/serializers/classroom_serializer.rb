class ClassroomSerializer
  include JSONAPI::Serializer
  attributes :room_location, :id
end
