module Api::V1
  class EmployeesController < BaseController

    def index
      @users = User.with_role :employee
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
