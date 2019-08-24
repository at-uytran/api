module Api
	module V1
		class ProductsController < ApplicationController
			def index
				render json: {data: Product.all.as_json}
			end

      def create
        Product.create(product_params)
      end

      private
      def product_params
        params.require(:product).permit(:name, :category_id, :price)
      end
		end
	end
end
