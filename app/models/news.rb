class News < ApplicationRecord
  has_one_attached :image
  validates :title, :content, :date, presence: true
  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']

  scope :latest, -> { News.last(3) }
  scope :pinned, -> { where(pin: 'true') }
end
