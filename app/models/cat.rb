class Cat < ApplicationRecord
  belongs_to :litter
  has_many_attached :images
  has_one_attached :lineage

  validates :name, :sex, :breed, :status, :breeding, :date_of_birth, presence: true
end
