class ChefMailer < ApplicationMailer
  default from: "steve@ironicrubydude.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.chef_mailer.signup_confirmation.subject
  #
  def signup_confirmation(chef)
    @chef = chef
    mail to: chef.email, subject: "Sign up Confirmation"
  end
end
