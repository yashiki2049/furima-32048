class UserItemsController < ApplicationController
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
    Payjp.api_key = "sk_test_47202a6356bdff3b5414c2ec"
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: params[:token],
      currency: 'jpy'
    )
  end

end