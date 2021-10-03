# frozen_string_literal: true

module Api
  module V1
    class CatsController < ApplicationController
      def available
        cat = Cat.available.includes(
          :litter,
          :breed,
          images: :image_blob
        ).with_attached_profile_image
        render json: cat, each_serializer: CatSerializer
      end
    end
  end
end
