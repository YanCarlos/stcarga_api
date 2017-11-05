class AuthenticationController < ApplicationController
  before_action :set_user, only: [:autenthicate_user, :logout_user]

  def autenthicate_user
    if user_validate?
      res = {
        nombre: @user.nombre,
        token: @user.token,
        role: @user.roles[0].name
      }
      render json: res, status: 200
    else
      acceso_denegado
    end
  end

  def logout_user
    if @user and @user.reset_token
      render json: @user, status: 200
    else
      acceso_denegado
    end
  end

  private
  def auth_params
    params.permit(:user, :password, :token)
  end

  def set_user
    @user = (
      User.find_by(email: params[:user]) || 
      User.find_by(cedula: params[:user]) ||
      User.find_by(token: params[:token])
    )  
  end


  def acceso_denegado
    res = {
      message: 'acceso_denegado'
    }
    render json: res, status: 401
  end

  def user_validate?
    @user and @user.authenticate params[:password] and @user.generate_token and @user.activo?
  end

end
