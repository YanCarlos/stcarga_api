class UserEmail < ApplicationMailer

  def when_user_was_regisred(user)
    @user = user
    mail(to: @user.email, subject: 'Bienvenido a nuestra compañia.')
  end

end
