# frozen_string_literal: true

class CatAttachedImage < ApplicationRecord
  has_one_attached :image
  belongs_to :cat

  validates :date, :cat_id, presence: true
  validate :validate_if_attached
  validate :validate_role

  private

  def validate_if_attached
    errors.add :base, 'cannot create attachment without an image' if image.attached? == false
  end

  def validate_role
    errors.add :base, 'error role invalid, can be profile or default' if role != 'profile' && role != 'default'
  end
end
