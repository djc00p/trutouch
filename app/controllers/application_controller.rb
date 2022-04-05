# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user
  add_flash_types :info, :warning, :success, :danger
  before_action :mailer_set_url_options

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end
end
