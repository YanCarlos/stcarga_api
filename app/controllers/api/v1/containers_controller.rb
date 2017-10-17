module Api::V1
  class ContainersController < BaseController
    before_action :set_container, only: [:show, :update, :destroy]

    def show
      json_response(@container)
    end

    def index
      @containers = Container.all
      json_response @containers, @containers.count
    end

    def create
      @container = Container.create!(container_params)
      json_response(@container, :created)
    end

    def update
      @container.update(container_params)
      json_response(@container, :updated)
    end

    def destroy
      @container.destroy
      json_response(@container, :deleted)
    end

    private
    def container_params
      params.permit(
        :codigo, 
        :entregado, 
        :fecha_devolucion, 
        :fecha_limite_devolucion, 
        :fecha_entrega,
        :naviera_id
      )
    end

    def set_container
      @container = Container.find(params[:id])
    end


  end
end
