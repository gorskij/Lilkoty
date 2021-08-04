# frozen_string_literal: true

class BreedSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :image_url, :history, :physical_attributes, :allergy_informations

  def image_url
    rails_blob_path(object.image, only_path: true)
  end
end
