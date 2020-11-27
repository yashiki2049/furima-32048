require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品情報の登録' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_img.jpg')
    end

    context '商品出品ができる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない時' do
      it 'imageを１枚つけないと登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'infoが空だと登録できないこと' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'category_idが未選択だと登録できないこと' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'status_idが未選択だと登録できないこと' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Status Select')
      end
      it 'shipping_burden_idが未選択だと登録できないこと' do
        @item.shipping_burden_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping burden Select')
      end
      it 'prefecture_idが未選択だと登録できないこと' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end
      it 'shipping_day_idが未選択だと登録できないこと' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day Select')
      end
      it 'priceが空だと登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300以下だと登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが9,999,999以上だと登録できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが半角数字以外だと登録できないこと' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end
