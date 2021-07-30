# frozen_string_literal: true

class LitterAttachedImage < ApplicationRecord
  has_one_attached :image
  belongs_to :litter

  validates :litter_id, presence: true
  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
