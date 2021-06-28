# frozen_string_literal: true

module Api
  module V1
    class LittersController < ApplicationController
      def index
        litters = Litter.all.order(id: :desc).includes(
          :mother,
          :father,
          :kittens,
          kittens: :images_blobs,
          mother: :images_blobs,
          father: :images_blobs
        )
        render json: litters, each_serializer: LitterSerializer
      end

      def show
        litter = Litter.includes(
          :mother,
          :father,
          :kittens,
          kittens: :images_blobs,
          mother: :images_blobs,
          father: :images_blobs
        ).find(params[:id])
        render json: litter, serializer: LitterSerializer
      end
    end
  end
end
