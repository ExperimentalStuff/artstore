class CartsController < ApplicationController
	before_action :authenticate_user!, only: [:checkout]

	def checkout
		@order = current_user.orders.build
		@info = @order.build_info
	end

	def abort
		current_cart.destroy
		session[:cart_id] = nil
		current_cart

		redirect_to carts_path
	end

end
