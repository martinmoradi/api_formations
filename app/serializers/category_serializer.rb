class CategorySerializer
  include JSONAPI::Serializer
  attributes :id, :title
end
