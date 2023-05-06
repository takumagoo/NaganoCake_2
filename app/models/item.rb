class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  # 画像カラムを定義
  has_one_attached :item_image

  # 画像が存在しない場合の処理
  def get_item_image(width, height, center)
      unless item_image.attached?
        file_path = Rails.root.join('app/assets/images/no_image.jpg')
        item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
      item_image.variant(resize_to_fill: [width, height]).processed
  end


end
