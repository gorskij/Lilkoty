class LitterSerializer < ActiveModel::Serializer
  attributes :id, :name, :mother, :father, :kittens
end
