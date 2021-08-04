# frozen_string_literal: true

class News < ApplicationRecord
  has_one_attached :image
  validates :title, :content, :date, presence: true
  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  def self.relevant(**args)
    NewsService::PickRelevant.call(**args)
  end
end
