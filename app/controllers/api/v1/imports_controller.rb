module Api::V1
  class ImportsController < BaseController
    before_action :set_import, only: [:show, :update, :destroy]

    def show
      json_response @import
    end

    def index
      @imports = Import.all 
      json_response @imports, @imports.count
    end

    def create
      @import = Import.create!(import_params)
      json_response(@import, :created)
    end

    def update
      @import.update(import_params)
      json_response(@import, :updated)
    end

    def destroy
      @import.destroy
      json_response(@import, :deleted)
    end


    private
    def import_params
      {
        user_id: params[:user_id],
        fecha: params[:fecha],
        codigo: params[:codigo]
      }
    end

    def set_import
      @import = Import.find(params[:id])
    end

  
  end
end
