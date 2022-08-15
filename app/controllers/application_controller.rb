# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :current_user?
  add_flash_types :info, :warning, :success, :danger
  before_action :mailer_set_url_options

  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end

  private

  def current_user
    @current_user ||= User.includes(:addresses, :vehicles).find(session[:user_id]) if session[:user_id]
  end

  def current_user?
    !!current_user
  end

  def authorized
    redirect_to sign_in_path, flash: { warning: "Please sign in" } unless current_user?
  end
end
