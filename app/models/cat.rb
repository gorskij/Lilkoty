# frozen_string_literal: true

class Cat < ApplicationRecord
  has_one_attached :profile_image
  belongs_to :litter, optional: true
  belongs_to :mother, class_name: 'Cat', optional: true
  belongs_to :father, class_name: 'Cat', optional: true
  belongs_to :breed, class_name: 'Breed'
  has_many :images, class_name: 'CatAttachedImage', foreign_key: 'cat_id', dependent: :destroy
  validates :name, :breed_id, :breeding, :date_of_birth, :colour, presence: true
  validate :validate_sex, :status
  validates :profile_image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']

  scope :available, -> { where(status: 'available') }

  private

  def validate_sex
    errors.add :base, 'error sex invalid, can be male or female' if sex != 'male' && sex != 'female'
  end

  def validate_status
    if status != 'available' && status != 'not-available' && status != 'reserved' && status != 'new-home'
      errors.add :base,
                 'error status invalid, can be available, not-available, new-home or reserved'
    end
  end
end
