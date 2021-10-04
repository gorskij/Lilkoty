# frozen_string_literal: true

class Cat < ApplicationRecord
  has_one_attached :profile_image
  belongs_to :litter, optional: true
  belongs_to :mother, class_name: 'Cat', optional: true
  belongs_to :father, class_name: 'Cat', optional: true
  belongs_to :breed, class_name: 'Breed'
  has_many :images, class_name: 'CatAttachedImage', dependent: :destroy
  validates :name, :breed_id, :breeding, :date_of_birth, :colour, presence: true
  validate :validate_sex, :status
  validates :profile_image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']

  scope :available, -> { where(status: 'available') }
  scope :from_our_breeding, -> { where(status: 'our-cat') }

  private

  def validate_sex
    return unless sex != 'male' && sex != 'female'

    errors.add :base, 'error sex invalid, can be male or female'
  end

  def validate_status
    return if %w[available not-available our-cat reserved new-home].include?(status)

    errors.add :base, 'error status invalid, can be available, not-available, our-cat, new-home or reserved'
  end
end
