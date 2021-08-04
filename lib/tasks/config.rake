# frozen_string_literal: true

namespace :config do
  desc 'create default config'
  task create: [:environment] do
    next unless Config.count.zero?

    Config.create!(pinned_news_id: News.pluck(:id).last, relevant_news_limit: 5)
    p 'success'
  end
end
