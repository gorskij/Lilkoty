# frozen_string_literal: true

module Api
  module V1
    class BreedsController < ApplicationController
      def index
        breeds = Breed.all.with_attached_image.order(created_at: :desc)
        render json: breeds, each_serializer: BreedSerializer
      end

      def show
        breed = Breed.with_attached_image.find(params[:id])
        render json: breed, serializer: BreedSerializer
      end
    end
  end
end
