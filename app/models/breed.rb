# frozen_string_literal: true

class Breed < ApplicationRecord
  has_one_attached :image

  validates :name, :history, :allergy_informations, :physical_attributes, presence: true
  validate :validate_if_attached

  private

  def validate_if_attached
    errors.add :base, 'cannot create attachment without an image' if image.attached? == false
  end
end
