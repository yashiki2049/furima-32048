require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  before do
    @item_purchase = FactoryBot.build(:item_purchase)
  end

  context '商品購入ができる時' do
    it 'すべての値が正しく入力されていれば商品購入・情報の保存ができること' do
      expect(@item_purchase).to be_valid
    end

    it 'buildingが空でも商品購入・情報の保存ができること' do
      @item_purchase.building = ''
      expect(@item_purchase).to be_valid
    end
  end

  context '商品購入ができない時' do
    it 'postal_codeが空だと保存できないこと' do
      @item_purchase.postal_code = ''
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeはハイフンを含んだ7桁の数字(例：123-4567)でないと保存できないこと' do
      @item_purchase.postal_code = '0000000'
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('Postal code Input correctly')
    end

    it 'prefecture_idが未選択だと保存できないこと' do
      @item_purchase.prefecture_id = 0
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('Prefecture Select')
    end

    it 'prefecture_idが空だと保存できないこと' do
      @item_purchase.prefecture_id = ""
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityが空だと保存できないこと' do
      @item_purchase.city = ''
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("City can't be blank")
    end

    it 'blockが空だと保存できないこと' do
      @item_purchase.block = ''
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Block can't be blank")
    end

    it 'phone_numberが空だと保存できないこと' do
      @item_purchase.phone_number = ''
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberはハイフンを含むと保存できないこと' do
      @item_purchase.phone_number = '000-0000-0000'
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('Phone number Input only number')
    end

    it 'phone_numberは11桁以内でないと保存できないこと' do
      @item_purchase.phone_number = '0000011111000'
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('Phone number Input only number')
    end

    it 'token(クレジットカード情報)がないと決済できないこと' do
      @item_purchase.token = nil
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Token can't be blank")
    end

    it 'user_idがないと保存できないこと' do
      @item_purchase.user_id = ''
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idがないと保存できないこと' do
      @item_purchase.item_id = ''
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Item can't be blank")
    end
  end
end
