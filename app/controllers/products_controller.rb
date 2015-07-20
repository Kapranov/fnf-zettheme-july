class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  layout 'dashboards'

  def index
    @users = User.all
    @products = current_user.products
    @order_item = current_order.order_items.new
  end

  def show
  end

  def new
    @product = current_user.products.new
  end

  def edit
  end

  def create
    @product = current_user.products.build(product_params)
    @product.user_id = current_user.id

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
      unless @product = current_user.products.where(id: params[:id]).first
        flash[:alert] = 'Product not found.'
        redirect_to root_url
      end
    end

    def product_params
      params.require(:product).permit(
        :user_id,
        :name,
        :sku,
        :description,
        :short_description,
        :active,
        :weight,
        :price,
        :cost_price,
        :featured,
        :stock_control,
        :category_id,
        uploads_avatars: [
          :avatar,
          :avatar_cache_id,
          :remove_avatar
        ],
        properties_attributes: [
          :id,
          :product_id,
          :key,
          :value,
          :_destroy
        ],
        attachments_attributes: [
          :id,
          :product_id,
          :_destroy,
          :attach,
          :attach_filename,
          :attach_size,
          :file_content_type,
          :attach_cache_id,
          :remove_attach
        ]
      )
    end
end
