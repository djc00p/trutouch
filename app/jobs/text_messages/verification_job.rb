class TextMessages::VerificationJob < ApplicationJob
  queue_as :default

  def perform(user)
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    from = ENV["TWILIO_PHONE_NUMBER"]
    client = Twilio::REST::Client.new(account_sid, auth_token)
    to = user.phone_number
    body = "Welcome to TruTouch Auto Detailing and Window Tint. To verify your acccount please enter verification code: #{user.verification_code}"

    client.messages.create(from: from, to: to, body: body)
  end
end
