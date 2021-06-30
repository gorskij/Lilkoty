# frozen_string_literal: true

module Api
  module V1
    class LittersController < ApplicationController
      def index
        litters = Litter.all.order(date_of_creation: :desc).includes(
          kittens: [images: :image_blob],
          mother: [images: :image_blob],
          father: [images: :image_blob]
        )
        render json: litters, each_serializer: LitterSerializer
      end

      def show
        litter = Litter.includes(
          kittens: [images: :image_blob],
          mother: [images: :image_blob],
          father: [images: :image_blob]
        ).find(params[:id])
        render json: litter, serializer: LitterSerializer
      end
    end
  end
end
