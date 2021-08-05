# frozen_string_literal: true

module Api
  module V1
    class LittersController < ApplicationController
      def index
        litters = Litter.all.order(date_of_creation: :desc).with_attached_profile_image
        render json: litters, each_serializer: LitterIndexSerializer
      end

      def show
        litter = Litter.includes(
          kittens: %i[
            profile_image_blob
            breed
          ],
          mother: %i[
            profile_image_blob
            breed
          ],
          father: %i[
            profile_image_blob
            breed
          ],
          images: :image_blob
        ).with_attached_profile_image.find(params[:id])
        render json: litter, serializer: LitterSerializer
      end
    end
  end
end
