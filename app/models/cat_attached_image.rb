# frozen_string_literal: true

class CatAttachedImage < ApplicationRecord
  has_one_attached :image
  belongs_to :cat

  validates :cat_id, presence: true
  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
