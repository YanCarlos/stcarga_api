module Api::V1
  class DispatchsController < BaseController
    before_action :set_dispatch, only: [:show, :destroy, :update]
    before_action :set_import, only: [:index]

    def show
      json_response(@dispatch)
    end

    def index
      unless filtrar
        @dispatchs = @import.dispatchs
      end
      json_response @dispatchs, @dispatchs.count
    end

    def create
      @dispatch = Dispatch.create!(dispatch_params)
      json_response(@dispatch, :created)
    end

    def destroy
      @dispatch.destroy
      json_response(@dispatch, :deleted)
    end

    def update
      @dispatch.update(dispatch_params)
      json_response(@dispatch, :updated)
    end

    private
    def dispatch_params
      params.permit(
        :codigo, 
        :fecha, 
        :import_id,
        :contacto,
        :telefono1,
        :telefono2,
        :descripcion,
        :direccion,
        :ciudad
      )
    end

    def set_dispatch
      @dispatch = Dispatch.find(params[:id])
    end

    def set_import
      @import = Import.find(params[:import_id])
    end

    def filtrar
      @dispatchs = Filter::Dispatchs.do params
    end

  end
end
