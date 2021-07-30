# frozen_string_literal: true

class LitterSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :mother, :father, :kittens, :date_of_creation, :images, :profile_image_url

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

  def profile_image_url
    rails_blob_path(object.profile_image, only_path: true)
  end
end
