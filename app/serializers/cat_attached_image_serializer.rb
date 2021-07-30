# frozen_string_literal: true

class CatAttachedImageSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :url, :date

  def url
    rails_blob_path(object.image, only_path: true)
  end
end
