class StoreController < ApplicationController
  respond_to :html, :js
  before_filter :authenticate_user!, except: [:index]
  before_filter :current_view
  layout 'store', only: [:index]

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end
end
