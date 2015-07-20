class CartsController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
  layout 'store', only: [:show]

  def show
    @order_items = current_order.order_items
  end
end
