class UserItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :move_to_index, only: [:index]

   def index
    @item = Item.find(params[:item_id])
    @item_purchase = ItemPurchase.new
   end

   def create
      @item = Item.find(params[:item_id])
      @item_purchase = ItemPurchase.new(purchase_params)
      if @item_purchase.valid?
        pay_item
        @item_purchase.save
        redirect_to root_path
      else
        render :index 
      end
   end

   private

   def purchase_params
    params.require(:item_purchase).permit(:postal_code, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id , item_id: params[:item_id], token: params[:token])
   end

   def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    binding.pry
     @item = Item.find(params[:item_id])
     redirect_to root_path unless current_user.id != @item.user_id
   end
   
end