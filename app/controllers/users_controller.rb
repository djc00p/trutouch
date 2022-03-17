# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users/1 or /users/1.json
  def show; end

  # GET /users/new
  def new
    if current_user
      flash[:danger] = "Already Signed In! Please sign out to create a new account."
      redirect_to profile_url(current_user)
    else
      @user = User.new
    end
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to TruTouch Auto Detail and Tint #{@user.first_name}!"
      redirect_to profile_url(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    redirect_to profile_url(@user) if @user.update(user_params)

    flash[:success] = "#{@user.first_name} profile info was successfully updated."
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    flash[:success] = "User was successfully destroyed."
    redirect_to root_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :email, :password)
  end
end
