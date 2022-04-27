# frozen_string_literal: true

class VehiclesController < ApplicationController
  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(**vehicle_params, user_id: current_user.id)
    @vehicle.assign_classification
    if @vehicle.save
      flash[:success] = "Your #{@vehicle.color} #{@vehicle.make} #{@vehicle.model} has been add!"
      redirect_to profile_url(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:year, :color, :make, :model)
  end
end
