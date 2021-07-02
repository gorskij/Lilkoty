# frozen_string_literal: true

class LitterAttachedImageSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :role, :url

  def url
    rails_blob_path(object.image, only_path: true)
  end
end
