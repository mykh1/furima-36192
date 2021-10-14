require 'rails_helper'

RSpec.describe OrderHistoryAddress, type: :model do
  describe '購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)      
      @order_history_address = FactoryBot.build(:order_history_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end
  
    context '内容に問題がない場合' do
      it '全ての値が正しく入力されている' do
        expect(@order_history_address).to be_valid
      end
      it '建物の名前が空でも購入できる' do
        @order_history_address.building_name = ''
        expect(@order_history_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと購入できない' do
        @order_history_address.token = ''
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと購入できない' do
        @order_history_address.postal_code = ''
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が「3桁-4桁」の半角文字列 出ないと購入できない' do
        @order_history_address.postal_code = '1234567'
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県のidが「０」だと購入できない' do
        @order_history_address.prefecture_id = 0
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("Prefecture can't be blank")

      end
      it '市区町村が空だと購入できない' do
        @order_history_address.city = ''
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できない' do
        @order_history_address.house_number = ''
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @order_history_address.telephone_number = ''
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it '電話番号が全角では購入できない' do
        @order_history_address.telephone_number = '０８０１２３４５６７８'
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it '電話番号は半角数字9桁以下では購入できない' do
        @order_history_address.telephone_number = '080123456'
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it '電話番号は半角数字12桁以上では購入できない' do
        @order_history_address.telephone_number = '080123456789'
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'userが紐付いていないと購入できない' do
        @order_history_address.user_id = nil
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと購入できない' do
        @order_history_address.item_id = nil
        @order_history_address.valid?
        expect(@order_history_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
