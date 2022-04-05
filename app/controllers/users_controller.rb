# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy verification verify]

  # GET /profile/1 or /profile/1.json
  def show; end

  # GET /profile/new
  def new
    if current_user
      flash[:danger] = "Already Signed In! Please sign out to create a new account."
      redirect_to profile_url(current_user)
    else
      @user = User.new
    end
  end

  # GET /profile/1/edit
  def edit; end

  # POST /profile or /profile.json
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to TruTouch Auto Detail and Tint #{@user.first_name}!"
      flash[:info] = "This account has not yet been verified."\
                     "Please check for an verification #{@user.prefered_method_of_contact}."

      redirect_to verification_url(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /profile/1 or /profile/1.json
  def update
    redirect_to profile_url(@user) if @user.update(user_params)

    flash[:success] = "#{@user.first_name} profile info was successfully updated."
  end

  # DELETE /profile/1 or /profile/1.json
  def destroy
    @user.destroy
    flash[:success] = "User was successfully destroyed."
    redirect_to root_path
  end

  # GET /profile/1/verification
  def verification
    @user.verify_through_prefered_method_of_contact
  end

  # PATCH /profile/1/verify
  def verify
    verification_code = user_params[:verification_code]

    return verification_url(@user) unless @user.verification_code == verification_code.to_i

    redirect_to thank_you_path if @user.update(status: "verified", verification_code: nil)

    flash[:success] = "#{@user.first_name} your account has been verified through #{@user.prefered_method_of_contact}"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :phone_number, :email, :password,
      :prefered_method_of_contact, :verification_code
    )
  end
end
