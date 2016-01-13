class Admin::ProductsController < ApplicationController
	layout "admin"

	before_action :authenticate_user!
	before_action :admin_required

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
		@photo = @product.build_photo
	end

	def create
		@product = Product.new(product_params)
		@photo = @product.build_photo

		if @product.save
			redirect_to admin_products_path
			flash[:notice] = "成功新增產品！"
		else
			render :new
			flash[:alert] = "未新增產品！"
		end
	end

	def edit
		@product = Product.find(params[:id])
		@photo = @product.photo || @product.build_photo
	end

	def update
		@product = Product.find(params[:id])
		@photo = @product.photo || @product.build_photo

		if @product.update(product_params)
			redirect_to admin_products_path
			flash[:notice] = "成功更新產品: #{@product.title} 之內容"
		else
			render :edit
			flash[:alert] = "產品未更新！"
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy

		redirect_to admin_products_path
		flash[:alert] = "產品已刪除！"

	end 

	private

		def product_params
			params.require(:product).permit(:title,:description,:quantity,:price, photo_attributes: [:image, :id])
		end
end
