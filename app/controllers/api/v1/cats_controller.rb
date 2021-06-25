# frozen_string_literal: true

module Api
  module V1
    class CatsController < ApplicationController
      def index
        cats = Cat.all.order(created_at: :desc).includes(:litter, :mother, :father).with_attached_images
        render json: cats, each_serializer: CatSerializer
      end

      def show
        cat = Cat.with_attached_images.find(params[:id])
        render json: cat, serializer: CatSerializer
      end
    end
  end
end
