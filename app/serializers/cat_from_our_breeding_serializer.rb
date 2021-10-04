# frozen_string_literal: true

class CatFromOurBreedingSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :colour, :breed, :breeding, :date_of_birth, :sex,
             :images, :lineage_url, :profile_image_url, :mother, :father

  def father
    ActiveModelSerializers::SerializableResource.new(
      object.father,
      serializer: CatSimplifiedSerializer
    ).as_json
  end

  def mother
    ActiveModelSerializers::SerializableResource.new(
      object.mother,
      serializer: CatSimplifiedSerializer
    ).as_json
  end

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
