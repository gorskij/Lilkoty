# frozen_string_literal: true

FactoryBot.define do
  factory :config do
    relevant_news_limit { 5 }
    pinned_news_id { create(:news).id }
  end
end
