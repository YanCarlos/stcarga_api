module Api::V1
  class NavierasController < BaseController
    before_action :set_naviera, only: [:show, :destroy, :update]

    def show
      json_response(@naviera)
    end

    def index
      @navieras = Naviera.all
      json_response @navieras, @navieras.count
    end

    def create
      @naviera = Naviera.create!(naviera_params)
      json_response(@naviera, :created)
    end

    def destroy
      @naviera.destroy
      json_response(@naviera, :deleted)
    end

    def update
      @naviera.update(naviera_params)
      json_response(@naviera, :updated)
    end

    private
    def naviera_params
      params.permit(
        :nombre, 
        :telefono, 
        :nota,
      )
    end
    def set_naviera
      @naviera = Naviera.find(params[:id])
    end

  end
end
