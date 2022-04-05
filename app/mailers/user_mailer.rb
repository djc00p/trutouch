class UserMailer < ApplicationMailer
  default from: "notifications@example.com"

  def welcome_verification
    @user = params[:user]
    mail(to: @user.email, subject: "Welcome To TruTouch")
  end
end
