class PlantsController < ApplicationController
  def index
    plants = Plant.all
    if plants
      render json: plants, except: %i[created_at updated_at], status: :ok
    else
      render json: { error: "Plants not found" }, status: :not_found
    end
  end

  def show
    plant = Plant.find_by(id: params[:id])
    if plant
      render json: plant, except: %i[created_at updated_at], status: :ok
    else
      render json: { error: "Plant not found" }, status: :not_found
    end
  end

  def create
    plant = Plant.create(plants_params)
    render json: plant, except: %i[created_at updated_at], status: :created
  end

  private

  def plants_params
    params.permit(:name, :image, :price)
  end
end
