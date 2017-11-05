module Api::V1
  class DriversController < BaseController
    before_action :set_driver, only: [:show, :destroy, :update]

    def show
      json_response(@driver)
    end

    def index
      @drivers = Driver.all
      json_response @drivers, @drivers.count
    end

    def create
      @driver = Driver.create!(driver_params)
      json_response(@driver, :created)
    end

    def destroy
      @driver.destroy
      json_response(@driver, :deleted)
    end

    def update
      @driver.update(driver_params)
      json_response(@driver, :updated)
    end

    private
    def driver_params
      params.permit(
        :nombre, 
        :cedula, 
        :tefono,
        :placa,
        :trailer
      )
    end

    def set_driver
      @driver = Driver.find(params[:id])
    end

  end
end
