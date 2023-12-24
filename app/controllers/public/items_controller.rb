class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @items = Item.page(params[:page]).per(8)
    @genres = Genre.all
    if params[:genre_id].present?
      #presentメソッドでparams[:genre_id]に値が含まれているか確認 => trueの場合下記を実行
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.page(params[:page]).per(8)
    end
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
    if params[:genre_id].present?
      #presentメソッドでparams[:genre_id]に値が含まれているか確認 => trueの場合下記を実行
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items
    end
  end

  def search
    if params[:name].present?
      @items = Item.where('name LIKE ?', "%#{params[:name]}%")
    else
      @items = Item.none
    end
  end
end
