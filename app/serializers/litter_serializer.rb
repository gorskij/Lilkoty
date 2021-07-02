# frozen_string_literal: true

class LitterSerializer < ActiveModel::Serializer
  attributes :id, :name, :mother, :father, :kittens, :date_of_creation, :images

  def mother
    ActiveModelSerializers::SerializableResource.new(object.mother).serializable_hash
  end

  def father
    ActiveModelSerializers::SerializableResource.new(object.father).serializable_hash
  end

  def kittens
    ActiveModelSerializers::SerializableResource.new(object.kittens).serializable_hash
  end

  def images
    ActiveModelSerializers::SerializableResource.new(object.images).serializable_hash
  end
end
