class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      # 会員ID
      t.integer :customer_id
      # 配送先郵便番号
      t.string :postal_code
      # 配送先住所
      t.string :address
      # 配送先氏名
      t.string :name
      # 送料
      t.integer :postage
      # 請求額
      t.integer :billing_amount
      # 支払い方法
      t.integer :payment_method
      # 注文ステータス
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
