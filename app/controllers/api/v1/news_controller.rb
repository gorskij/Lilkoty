# frozen_string_literal: true

module Api
  module V1
    class NewsController < ApplicationController
      def index
        news = News.all.order(date: :desc).with_attached_image
        render json: news, each_serializer: NewsSerializer
      end

      def relevant
        news = News.relevant(news_limit: params[:news_limit].to_i)
        render json: news, each_serializer: NewsSerializer
      end
    end
  end
end
