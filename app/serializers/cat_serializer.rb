# frozen_string_literal: true

class CatSerializer < ActiveModel::Serializer
  attributes :id, :name, :colour, :status, :breed, :breeding, :date_of_birth, :sex,
             :images, :lineage_url, :mother_id, :father_id, :litter_id

  def images
    ActiveModelSerializers::SerializableResource.new(object.images).serializable_hash
  end

  def breed
    ActiveModelSerializers::SerializableResource.new(object.breed).serializable_hash
  end
end
