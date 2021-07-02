# frozen_string_literal: true

class Litter < ApplicationRecord
  belongs_to :mother, class_name: 'Cat'
  belongs_to :father, class_name: 'Cat'
  has_many :kittens, class_name: 'Cat', foreign_key: 'litter_id'
  has_many :images, class_name: 'LitterAttachedImage', foreign_key: 'litter_id', dependent: :destroy
  validates :name, :mother_id, :father_id, :date_of_creation, presence: true
end
