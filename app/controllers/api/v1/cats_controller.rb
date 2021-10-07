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

      def from_our_breeding
        cat = Cat.from_our_breeding.includes(
          { mother: :profile_image_blob },
          { father: :profile_image_blob },
          { images: :image_blob },
          :breed
        ).with_attached_profile_image
        render json: cat, each_serializer: CatFromOurBreedingSerializer
      end
    end
  end
end
