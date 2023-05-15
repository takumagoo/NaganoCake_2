class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all

    if params[:genre].blank?
      @items = Item.all
    else
      @genre = Genre.find(params[:genre])
      @items = @genre.items
    end
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end


end
