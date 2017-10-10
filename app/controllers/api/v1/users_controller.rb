module Api::V1
  class UsersController < BaseController

    def index
      @users = User.all
      json_response @users, @users.count
    end

    def create
      @user = User.create!(user_params)
      json_response(@user, :created)
    end

    private
    def user_params
      params.permit(:nombre, :email, :telefono, :direccion, :activo)
    end

  end
end
