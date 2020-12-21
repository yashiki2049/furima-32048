class ItemsController < ApplicationController
  before_action :basic_auth #ベーシック認証
  before_action :set_item, only: [:show, :edit, :update, :destroy] 
  before_action :authenticate_user!, except: [:show, :index]
  before_action :move_to_index_soldout, only: [:edit]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

   def basic_auth
     authenticate_or_request_with_http_basic do |username, password|
       username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
     end
   end

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :status_id, :shipping_burden_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index_soldout #売却済みの商品の編集ページには遷移できない
    # @item = Item.find(params[:id]) set_itemで取得済
    redirect_to root_path unless @item.user_item.blank?
  end

  def move_to_index #編集ページには出品者以外遷移できない
    # @item = Item.find(params[:id])  set_itemで取得済
    redirect_to root_path unless current_user.id == @item.user_id
  end
end
