# frozen_string_literal: true

class Config < ApplicationRecord
  def self.pinned_news_id
    first.pinned_news_id
  end

  def self.relevant_news_limit
    first.relevant_news_limit
  end
end
