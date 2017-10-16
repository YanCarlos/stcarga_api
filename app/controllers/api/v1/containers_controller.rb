module Api::V1
  class ContainersController < BaseController

    def index
      @containers = Container.all
      json_response @containers, @containers.count
    end

    def create
      @Container = Container.create!(user_params)
      json_response(@container, :created)
    end

    private
    def user_params
      params.permit(
        :codigo, 
        :entregado, 
        :fecha_entrada, 
        :fecha_limite_salida, 
        :fecha_entrega,
        :naviera
      )
    end

  end
end
