# frozen_string_literal: true

class LitterSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :mother, :father, :kittens, :date_of_creation, :images, :profile_image_url

  def mother
    ActiveModelSerializers::SerializableResource.new(
      object.mother,
      serializer: CatSimplifiedSerializer
    ).as_json
  end

  def father
    ActiveModelSerializers::SerializableResource.new(
      object.father,
      serializer: CatSimplifiedSerializer
    ).as_json
  end

  def kittens
    ActiveModelSerializers::SerializableResource.new(
      object.kittens,
      each_serializer: CatSimplifiedSerializer
    ).as_json
  end

  def images
    ActiveModelSerializers::SerializableResource.new(object.images).as_json
  end

  def profile_image_url
    rails_blob_path(object.profile_image, only_path: true)
  end
end
