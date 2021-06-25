# frozen_string_literal: true

class Cat < ApplicationRecord
  belongs_to :litter, optional: true
  belongs_to :mother, class_name: 'Cat', optional: true
  belongs_to :father, class_name: 'Cat', optional: true
  has_many_attached :images
  has_one_attached :lineage
  validates :name, :breed, :status, :breeding, presence: true
  validate :validate_sex

  # def kittens
  #   Cat.where(father_id: id) if sex == 'male'
  #   Cat.where(mother_id: id) if sex == 'female'
  # end

  private

  def validate_sex
    errors.add :base, 'error sex invalid, can be male or female' if sex != 'male' && sex != 'female'
  end
end
