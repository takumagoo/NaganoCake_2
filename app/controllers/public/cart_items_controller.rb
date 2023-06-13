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
    if @cart_item
      # カート内の個数をフォームから送られた個数分追加する ==> アップデート
      new_amount = @cart_item.amount + cart_item_params[:amount].to_i
      @cart_item.update(amount: new_amount)
    else
    # 存在しなかった場合
    # カートモデルにレコードを新規作成する
      @cart_item = current_customer.cart_items.new(cart_items_params)
      @cart_item.save

    end
    redirect_to cart_items_path
  end

  # 個数変更の更新
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_items_params)
    redirect_to cart_items_path
  end

  # 削除機能
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  # 全部を削除
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_items_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
