# frozen_string_literal: true

class Cat < ApplicationRecord
  belongs_to :litter, optional: true
  belongs_to :mother, class_name: 'Cat', optional: true
  belongs_to :father, class_name: 'Cat', optional: true
  has_many :images, class_name: 'CatAttachedImage', foreign_key: 'cat_id', dependent: :destroy
  validates :name, :breed, :status, :breeding, presence: true
  validate :validate_sex

  private

  def validate_sex
    errors.add :base, 'error sex invalid, can be male or female' if sex != 'male' && sex != 'female'
  end
end
