# frozen_string_literal: true

class LitterSerializer < ActiveModel::Serializer
  attributes :id, :name, :mother, :father, :kittens, :date_of_creation

  def mother
    ActiveModelSerializers::SerializableResource.new(object.mother).serializable_hash
  end

  def father
    ActiveModelSerializers::SerializableResource.new(object.father).serializable_hash
  end

  def kittens
    ActiveModelSerializers::SerializableResource.new(object.kittens).serializable_hash
  end
end
