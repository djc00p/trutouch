# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    if current_user
      flash[:danger] = "Already Signed In"
      redirect_to profile_url(current_user)
    else
      @new ||= User.new
    end
  end

  def create
    user = User.find_by(email: params[:session][:email])
    check_authentication(user)
  end

  def check_authentication(user)
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.first_name}!"
      redirect_to profile_url(user)
    else
      flash[:danger] = "Email or password is invalid, please try again."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "See Ya! We look forward to your next visit!"
    redirect_to root_path
  end
end
