class Api::V1::CatsController < ApplicationController
  def index
    cat = Cat.all.order(created_at: :desc)
    render json: cat
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
    params.permit(:name, :sex, :breed, :status, :breeding, :date_of_birth)
  end
  def cat
    @cat ||= Cat.find(params[:id])
  end
end
