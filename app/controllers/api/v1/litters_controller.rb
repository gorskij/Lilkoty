# frozen_string_literal: true

module Api
  module V1
    class LittersController < ApplicationController
      def index
        litters = Litter.all.order(date_of_creation: :desc).includes(
          kittens: [
            :profile_image_blob,
            { breed: :image_blob, images: :image_blob }
          ],
          mother: [
            :profile_image_blob,
            { breed: :image_blob, images: :image_blob }
          ],
          father: [
            :profile_image_blob,
            { breed: :image_blob, images: :image_blob }
          ],
          images: :image_blob
        ).with_attached_profile_image
        render json: litters, each_serializer: LitterSerializer
      end

      def show
        litter = Litter.includes(
          kittens: [
            :profile_image_blob,
            { breed: :image_blob, images: :image_blob }
          ],
          mother: [
            :profile_image_blob,
            { breed: :image_blob, images: :image_blob }
          ],
          father: [
            :profile_image_blob,
            { breed: :image_blob, images: :image_blob }
          ],
          images: :image_blob
        ).with_attached_profile_image.find(params[:id])
        render json: litter, serializer: LitterSerializer
      end
    end
  end
end
