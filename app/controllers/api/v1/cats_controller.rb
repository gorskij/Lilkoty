# frozen_string_literal: true

module Api
  module V1
    class CatsController < ApplicationController
      def index
        cats = Cat.all.includes(images: :image_blob, breed: :image_blob).with_attached_profile_image.order(created_at: :desc)
        render json: cats, each_serializer: CatSerializer
      end

      def show
        cat = Cat.includes(images: :image_blob, breed: :image_blob).with_attached_profile_image.find(params[:id])
        render json: cat, serializer: CatSerializer
      end

      def available
        cat = Cat.available.includes(images: :image_blob, breed: :image_blob).with_attached_profile_image
        render json: cat, each_serializer: CatSerializer
      end
    end
  end
end
