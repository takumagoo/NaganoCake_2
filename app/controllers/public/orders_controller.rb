class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    # orderの保存
    @order = Order.new(order_params)
    @order.save

    # order_detailsの保存

    current_customer.cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.orders_id =  @order.id
      order_detail.item_id = cart_item.item_id
      order_detail.amount = cart_item.amount
      order_detail.price = cart_item.item.tax_included
      order_detail.save
    end

    # 注文者のカート内商品を全て削除
    current_customer.cart_items.destroy_all

    # 購入完了画面に遷移
    redirect_to orders_complete_path

  end

  def confirm
    @order = Order.new(order_params);

    #支払方法の取得
     @order.payment_method = params[:order][:payment_method]

    # 自身の住所
    if params[:order][:address_select] == "own_address"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

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

    @postage = 800

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
