# frozen_string_literal: true

class LitterCatsSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :colour, :status, :breed, :breeding, :date_of_birth, :sex,
             :images, :lineage_url, :personality, :profile_image_url

  def images
    ActiveModelSerializers::SerializableResource.new(object.images).as_json
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
