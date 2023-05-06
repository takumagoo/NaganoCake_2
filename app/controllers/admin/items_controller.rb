class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def create
    # 新規登録ボタンが押されたら、データを変数に格納
    item = Item.new(item_params)
    # セーブする
    item.save!
    # 処理後のpathを指定
    redirect_to admin_items_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
     @item = Item.find(params[:id])
  end

  def update

  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :item_image)
  end

end
