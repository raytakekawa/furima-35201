require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品ができる時' do

      it "name、description、image、shipping_cost、prefecture、shipping_days、status、priceが存在すれば出品ができること" do
        expect(@item).to be_valid
      end  

      # it "imageは一枚添付していれば出品ができること" do
      #   @item.image = 'a.png'
      #   expect(@item).to be_valid
      # end

      it "priceは¥300以上であれば出品できること" do
        @item.price = 300
        expect(@item).to be_valid
      end

      it "priceは¥9999999以内であれば出品ができること" do
        @item.price = 9999999
        expect(@item).to be_valid
      end

      it "priceは半角数字で入力された時のみ出品ができること" do
        @item.price = 2222
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない時' do

      it "nameが空では出品できないこと" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "descriptionが空では出品できないこと" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "category_idが1では出品できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "shipping_cost_idが1では出品できないこと" do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost must be other than 1")
      end

      it "prefecture_idが1では出品できないこと" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "shipping_days_idが1では出品できないこと" do
        @item.shipping_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days must be other than 1")
      end

      it "status_idが1では出品できないこと" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it "priceが空では出品できないこと" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceは全角文字では出品できないこと" do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceは半角英数混合では出品できないこと" do
        @item.price = '12ab'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceは半角英語だけでは出品できないこと" do
        @item.price = 'abcd'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceは¥300未満だと出品できないこと" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "priceは¥10000000以上だと出品できないこと" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "imageが空だと出品できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end  
  end
end