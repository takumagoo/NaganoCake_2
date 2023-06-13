class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def create
    
  end
  
  def confirm
    @order = Order.new(order_params);
    
    # 自身の住所
    if params[:order][:address_select] == "own_address"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.name
    
    # 登録済み住所
    elsif params[:order][:address_select] == "registered_address"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    
    # 新しいお届け先 
    elsif params[:order][:address_select] == "new_address"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end
  
  def index
  end

  def show
    
  end
  
  private

   # ストロングパラメータ
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :billing_amount, :payment_method, :status )
  end

  
end
