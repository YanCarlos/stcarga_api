module Api::V1
  class ImportProductsController < BaseController
    before_action :set_import, only: [:index]
    before_action :set_import_products, only: [:show, :update, :destroy]

    def show
      json_response @import_product
    end

    def index
      @import_products = @import.import_products 
      json_response @import_products, @import_products.count
    end

    def create
      @import_product = ImportProduct.create!(import_products_params)
      json_response(@import_product, :created)
    end

    def update
      @import_product.update(import_products_params)
      json_response(@import_product, :updated)
    end

    def destroy
      @import_product.destroy
      json_response(@import_product, :deleted)
    end


    private
    def import_products_params
      {
        import_id: params[:import_id],
        product_id: params[:product_id],
        container_id: params[:container_id],
        identificacion: params[:identificacion],
        paquetes: params[:paquetes],
        unidad_por_paquete: params[:unidad_por_paquete],
        peso_neto: params[:peso_neto]

      }
    end

    def set_import
      @import = Import.find(params[:import_id])
    end

    def set_import_products
      @import_product = ImportProduct.find(params[:id])
    end

  end
end
