# frozen_string_literal: true

module Api
  module V1
    class LittersController < ApplicationController
      def index
        litters = Litter.all.order(created_at: :desc).includes(:mother, :father, :kittens)
        render json: litters, each_serializer: LitterSerializer
      end

      def show
        litter = Litter.find(params[:id])
        render json: litter, serializer: LitterSerializer
      end
    end
  end
end
