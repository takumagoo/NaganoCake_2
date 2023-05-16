class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @subtotal = current_customer.cart_items.new
    @total_amount = current_customer.cart_items.new
  end

  def create
    @cart_item = current_customer.cart_items.find_by(item_id: cart_items_params[:item_id])
    # 追加した商品がカート内に存在するかの判別
    # 存在した場合
    if @cart_items.find_by(cart_item: cart_items_params[:item_id])
      # カート内の個数をフォームから送られた個数分追加する ==> アップデート
      @cart_item.update(params[:amount])
    else
    # 存在しなかった場合
    # カートモデルにレコードを新規作成する
      @cart_item = current_customer.cart_items.new(cart_items_params)
      @cart_item.save
      redirect_to cart_items_path
    end
  end

  # 個数変更の更新
  def update
    @cart_item = CartItem.new(params[:id])
    @cart_item.update(cart_items_params)
    redirect_to cart_items_path
  end

  private

  def cart_items_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
