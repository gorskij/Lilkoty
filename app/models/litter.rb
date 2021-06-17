class Litter < ApplicationRecord
  has_many :cats
  validates :name, :mother_id, :father_id, presence: true
end
