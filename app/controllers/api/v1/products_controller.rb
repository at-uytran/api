module Api
	module V1
		class ProductsController < ApplicationController
			def index
				render json: {data: Product.all.as_json}
			end
		end
	end
end
