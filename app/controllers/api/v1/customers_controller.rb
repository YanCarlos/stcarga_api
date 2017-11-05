module Api::V1
  class CustomersController < BaseController
    before_action :set_customer, only: [:show, :update]

    def show
      json_response @customer
    end

    def index
      unless filtrar
        @customers = User.with_role :customer
      end
      json_response @customers, @customers.count
    end

    def create
      @customer = User.new(customer_params)
      @customer.be_customer
      @customer.save!
      json_response(@customer, :created)
    end

    def update
      @customer.update(customer_params)
      json_response(@customer, :updated)
    end


    private
    def customer_params
      params.permit(
        :nombre, 
        :cedula,
        :email, 
        :telefono, 
        :direccion, 
        :activo, 
        :nombre_contacto,
        :telefono_contacto
      )
    end

    def set_customer
      @customer = User.find(params[:id]) 
    end

    def filtrar
      @customers = Filter::Customer.do params
    end

  end
end
