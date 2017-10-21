class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.user_registered.subject
  #
  def customer_registered user
    @user = user
    mail(to: @user.email, subject: 'Bienvenido a nuestra compañia.')
  end
end
