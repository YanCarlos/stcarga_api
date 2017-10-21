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
      return if params[:string].nil? && params[:activo].nil?
      if params[:activo] == 'false' || 'true'
        @customers = User.where("activo = '#{params[:activo]}' and nombre_contacto is not null")
      end
      if params[:string]
        query = "(lower(nombre) like '%#{params[:string].downcase}%' or 
                 lower(nombre_contacto) like '%#{params[:string].downcase}%' or
                 lower(email) like '%#{params[:string].downcase}%' )"
        @customers = User.where(
          query + 'and nombre_contacto is not null'
        )
      end
      @customers
    end

  end
end
