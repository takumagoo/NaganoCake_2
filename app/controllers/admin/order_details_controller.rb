class Admin::OrderDetailsController < ApplicationController


  private

  def order_detail_params
    params.require(:order_detail).permit(:orders_id, :item_id, :price, :amount, :making_status)
  end

end
