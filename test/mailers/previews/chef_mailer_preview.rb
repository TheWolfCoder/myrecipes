# Preview all emails at http://localhost:3000/rails/mailers/chef_mailer
class ChefMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/chef_mailer/signup_confirmation
  def signup_confirmation
    ChefMailer.signup_confirmation
  end

end
