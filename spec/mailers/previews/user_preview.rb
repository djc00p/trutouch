# Preview all emails at http://localhost:3000/rails/mailers/user
class UserPreview < ActionMailer::Preview
  def welcome_activation
    user = User.first
    UserMailer.with(user: user).welcome_activation
  end
end
