module Api::V1
  class EmployeesController < BaseController
    before_action :set_employee, only: [:show, :update]

    def show
      json_response @employee
    end

    def index
      @employees = User.with_role :employee
      json_response @employees, @employees.count
    end

    def create
      @employee = User.new(employee_params)
      @employee.be_employee
      @employee.save!
      json_response(@employee, :created)
    end

    def update
      @employee.update(employee_params)
      json_response(@employee, :updated)
    end


    private
    def employee_params
      params.permit(:nombre, :email, :telefono, :direccion, :activo)
    end

    def set_employee
      @employee = User.find(params[:id]) 
    end

  end
end
