module Api::V1
  class CustomersController < BaseController
    before_action :set_customer, only: [:show]

    def show
      json_response @customer
    end

    def index
      @customers = User.with_role :customer
      json_response @customers, @customers.count
    end

    def create
      @customer = User.create!(user_params)
      if @customer
        @customer.be_customer
      end
      json_response(@customer, :created)
    end

    private
    def user_params
      params.permit(:nombre, :email, :telefono, :direccion, :activo)
    end

    def set_customer
      @customer = User.find(params[:id]) 
    end

  end
end
