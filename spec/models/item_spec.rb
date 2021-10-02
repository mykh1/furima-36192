require 'rails_helper'

RSpec.describe Item, type: :model do

  describe '出品する' do
    before do
      @item = FactoryBot.build(:item)
    end


    context '内容に問題がない場合' do
      it '全ての値が正しく入力されている' do
        expect(@item).to be_valid
      end
    end

  
    context '内容に問題がある場合' do
      it '商品画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      
      it '商品名がないと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      
      it '商品の説明がないと出品できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
     
      it 'カテゴリーidが「０」だと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品状態のidが「０」だと出品できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担のidが「０」だと出品できない' do
        @item.shipping_cost_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end
      it '発送元の地域のidが「０」だと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数のidが「０」だと出品できない' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it '販売価格が空だと出品できない' do
        @item.price = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceが全角数字だと保存できないこと' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it '販売価格が300円未満だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it '販売価格が9,999,999円以上だと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end


    end
  end
end
