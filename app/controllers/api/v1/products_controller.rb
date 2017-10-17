module Api::V1
  class ProductsController < BaseController
    before_action :set_product, only: [:show, :destroy, :update]

    def show
      json_response(@product)
    end

    def index
      @products = Product.all
      json_response @products, @products.count
    end

    def create
      @product = Product.create!(product_params)
      json_response(@product, :created)
    end

    def destroy
      @product.destroy
      json_response(@product, :deleted)
    end

    def update
      @product.update(product_params)
      json_response(@product, :updated)
    end

    private
    def product_params
      params.permit(
        :nombre, 
        :referencia, 
        :descripcion,
      )
    end
    def set_product
      @product = Product.find(params[:id])
    end

  end
end
