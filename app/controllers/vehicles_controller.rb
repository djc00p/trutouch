# frozen_string_literal: true

class VehiclesController < ApplicationController
  before_action :authorized
  before_action :user, only: %i[index new create]
  before_action :set_vehicle, only: %i[show destroy]

  def index
    @vehicles = @user.vehicles
  end

  def new
    @vehicle = @user.vehicles.build
  end

  def show; end

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

  def destroy
    @user = User.find(@vehicle.owner_id)
    @vehicle.destroy
    flash[:success] = "Your vehicle has been deleted!"
    redirect_to profile_my_vehicles_url(@user)
  end

  private

  def user
    @user = current_user
  end

  def set_vehicle
    @vehicle = Vehicle.find_by(id: params[:id], owner_id: current_user.id)
  end

  def vehicle_params
    params.require(:vehicle).permit(:year, :color, :make, :model)
  end
end
