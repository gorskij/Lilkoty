# frozen_string_literal: true

class CatSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :colour, :status, :breed, :breeding, :date_of_birth, :sex,
             :images, :lineage_url, :mother_id, :father_id, :litter_id, :health, :personality, :profile_image_url

  def images
    ActiveModelSerializers::SerializableResource.new(object.images).serializable_hash
  end

  def breed
    ActiveModelSerializers::SerializableResource.new(object.breed).serializable_hash
  end

  def profile_image_url
    rails_blob_path(object.profile_image, only_path: true)
  end
end
