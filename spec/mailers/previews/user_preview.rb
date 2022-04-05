# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/user
class UserPreview < ActionMailer::Preview
  def welcome_verification
    user = User.first
    user.verification_code = SecureRandom.random_number(100_000..999_999)
    UserMailer.with(user: user).welcome_verification
  end
end
