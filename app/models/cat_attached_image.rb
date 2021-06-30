# frozen_string_literal: true

class CatAttachedImage < ApplicationRecord
  has_one_attached :image
  belongs_to :cat

  validates :role, :date, :cat_id, presence: true
  validate :validate_if_attached

  private

  def validate_if_attached
    errors.add :base, 'cannot create without an image' if image.attached? == false
  end
end
