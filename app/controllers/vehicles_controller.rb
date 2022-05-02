# frozen_string_literal: true

class VehiclesController < ApplicationController
  before_action :find_user, only: %i[new create]

  def new
    @vehicle = @user.vehicles.build
  end

  def create
    @vehicle = @user.vehicles.build(**vehicle_params)
    @vehicle.assign_classification
    if @vehicle.save
      flash[:success] = "Your #{@vehicle.color} #{@vehicle.make} #{@vehicle.model} has been add!"
      redirect_to profile_url(@user)
    else
      flash[:danger] = "Vehicle not found. Couldn't assign vehicle class."
      render :new, status: :temporary_redirect
    end
  end

  private

  def find_user
    profile_id = params[:profile_id]
    @user = User.find(profile_id)
  end

  def vehicle_params
    params.require(:vehicle).permit(:year, :color, :make, :model)
  end
end
