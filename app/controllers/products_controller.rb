class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def add_to_cart
		@product = Product.find(params[:id])

		if !current_cart.items.include?(@product)
			current_cart.add_product_to_cart(@product)
			flash[:notice] = "你已成功將 #{@product.title} 加入購物車"
		else
			flash[:warning] = "你的購物車內已有此物品"
		end
		
		redirect_to :back
	end

	def remove_from_cart
		@cart_product = CartItem.find_by({product_id: params[:product_id], cart_id: current_cart.id})
		@cart_product.destroy

		redirect_to carts_path
	end

end