class UserMailer < ApplicationMailer
  default :from => "gerencia@stcarga.com"
  

  def customer_registered user
    @user = user
    mail(to: @user.email, subject: 'Bienvenido a nuestra compañia.')
  end

  def employee_registered user
    @employee = user
    mail(to: @employee.email, subject: 'Bienvenido a nuestra compañia.')
  end

end
