class CatSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :colour, :status, :breed, :breeding, :date_of_birth, :sex, :mother, :father, :litter, :images_url

  def images_url
    object.images.map do |image|
      rails_blob_path(image, only_path: true)
    end
  end
  
end
