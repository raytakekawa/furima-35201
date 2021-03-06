require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
    end

    context '商品購入できる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_destination).to be_valid
      end

      it '建物名がなくても保存できること' do
        @order_destination.building_name = nil
        expect(@order_destination).to be_valid
      end
    end

    context '商品購入できない時' do

      it "post_codeが空では購入できないこと" do
        @order_destination.post_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code can't be blank")
      end

      it "post_codeはハイフンなしでは購入できないこと" do
        @order_destination.post_code = '0000001'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code Input correctly")
      end

      it "prefecture_idが1では購入できないこと" do
        @order_destination.prefecture_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture Select")
      end

      it "cityが空では購入できないこと" do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end

      it "addressが空では購入できないこと" do
        @order_destination.address = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address can't be blank")
      end

      it "phone_numberが空では購入できないこと" do
        @order_destination.phone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberは英数混合では購入できないこと" do
        @order_destination.phone_number = '0900000aaaa'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number Input only number")
      end

      it "phone_numberは十二桁以上では購入できないこと" do
        @order_destination.phone_number = '090000000000'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number Input only number")
      end

      it 'userが紐付いていないと保存できないこと' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end

      it "itemが結びついていないと購入できないこと" do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
    end  
  end
end