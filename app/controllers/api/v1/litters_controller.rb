# frozen_string_literal: true

module Api
  module V1
    class LittersController < ApplicationController
      def initialize
        @cat_includes = [
          :profile_image_blob,
          :breed,
          { images: :image_blob }
        ]
      end

      def index
        litters = Litter.all.order(date_of_creation: :desc).with_attached_profile_image
        render json: litters, each_serializer: LitterIndexSerializer
      end

      def show
        litter = Litter.includes(
          kittens: @cat_includes,
          mother: @cat_includes,
          father: @cat_includes,
          images: :image_blob
        ).with_attached_profile_image.find(params[:id])
        render json: litter, serializer: LitterSerializer
      end
    end
  end
end
