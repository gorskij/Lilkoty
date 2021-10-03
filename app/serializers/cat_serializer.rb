# frozen_string_literal: true

class CatSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :colour, :status, :breed, :breeding, :date_of_birth, :sex,
             :images, :lineage_url, :litter, :personality, :profile_image_url

  def images
    ActiveModelSerializers::SerializableResource.new(object.images).as_json
  end

  def litter
    ActiveModelSerializers::SerializableResource.new(
      object.litter,
      serializer: LitterSimplifiedSerializer
    ).as_json
  end

  def breed
    ActiveModelSerializers::SerializableResource.new(
      object.breed,
      serializer: BreedSimplifiedSerializer
    ).as_json
  end

  def profile_image_url
    rails_blob_path(object.profile_image, only_path: true)
  end
end
