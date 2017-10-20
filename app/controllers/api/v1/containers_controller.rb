module Api::V1
  class ContainersController < BaseController
    before_action :set_container, only: [:show, :update, :destroy]

    def show
      json_response(@container)
    end

    def index
      if params[:codigo].nil?
        @containers = Container.all
      else
        @containers = Container.filtrar(params)
      end
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
        :inicio_de_mora,
        :ingreso_a_bodega,
        :user_id
      )
    end

    def set_container
      @container = Container.find(params[:id])
    end


  end
end
