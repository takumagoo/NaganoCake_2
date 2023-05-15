class Public::CartItemsController < ApplicationController
  def index

  end
  def create
    @cart_item = current_customer.cart_items.find_by(item_id: cart_items_params[:item_id])
    # @cart_item = current_customer.cart_items.find_by(item_id: cart_item_params[:item_id])
    @cart_item.save!

    redirect_to cart_items_path
  end

  private

  def cart_items_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
