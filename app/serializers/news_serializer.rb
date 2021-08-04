# frozen_string_literal: true

class NewsSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :image_url, :content, :video_url

  def image_url
    rails_blob_path(object.image, only_path: true)
  end
end
