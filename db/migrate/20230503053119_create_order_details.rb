class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      # 注文情報ID
      t.integer :orders_id
      # 商品ID
      t.integer :item_id
      # 購入時の価格(税込み)
      t.integer :price
      # 数量
      t.integer :amount
      # 製造ステータス
      t.integer :making_status

      t.timestamps
    end
  end
end
