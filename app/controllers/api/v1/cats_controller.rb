class Api::V1::CatsController < ApplicationController
  def index
    cats = Cat.all.order(created_at: :desc).includes(:litter, :mother, :father).with_attached_images
    render json: cats, each_serializer: CatSerializer
  end

  def create
    cat = Cat.create!(cat_params)
    if cat
      render json: cat
    else
      render json: cat.errors
    end
  end

  def show
    if cat
      render json: cat
    else
      render json: cat.errors
    end
  end

  def destroy
    cat&.destroy
    render json: { message: 'Cat deleted!' }
  end
  private

  def cat_params
    params.permit(:name, :sex, :breed, :status, :breeding, :date_of_birth, images: [])
  end
  def cat
    @cat ||= Cat.find(params[:id])
  end
end
