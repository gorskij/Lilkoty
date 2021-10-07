# frozen_string_literal: true

class CatSimplifiedSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :profile_image_url

  def profile_image_url
    rails_blob_path(object.profile_image, only_path: true)
  end
end
