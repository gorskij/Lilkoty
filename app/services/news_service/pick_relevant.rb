# frozen_string_literal: true

module NewsService
  class PickRelevant < BaseService
    def initialize(news_limit: Config.relevant_news_limit)
      @news_limit = news_limit_check_from_args(news_limit)
      @pinned_news_id = Config.pinned_news_id
    end

    def call
      relevant_news
    end

    private

    def relevant_news
      return latest_news if News.where(id: @pinned_news_id).count.zero?

      pinned_news + latest_news_without_pinned
    end

    def pinned_news
      News.where(id: @pinned_news_id).with_attached_image
    end

    def latest_news_without_pinned
      News.all.order(date: :desc).where.not(id: @pinned_news_id).with_attached_image.last(@news_limit - 1)
    end

    def latest_news
      News.all.order(date: :desc).last(@news_limit)
    end

    def news_limit_check_from_args(news_limit)
      return Config.relevant_news_limit unless args_valid(news_limit)

      news_limit
    end

    def args_valid(news_limit)
      return false unless news_limit.is_a?(Integer) && news_limit.positive?

      true
    end
  end
end
