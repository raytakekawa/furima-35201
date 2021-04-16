require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "name、description、image、shipping_cost、prefecture、shipping_days、status、priceが存在すれば出品ができること" do
      expect(@item).to be_valid
    end  

    it "imageは一枚添付していれば出品ができること" do
      @item.image = 'a.png'
      expect(@item).to be_valid
    end

    it "priceは¥300以上であれば出品できること" do
      @item.price = '300'
      expect(@item).to be_valid
    end

    it "priceは¥9999999以内であれば出品ができること" do
      @item.price = '9999999'
      expect(@item).to be_valid
    end

    it "priceは半角数字で入力された時のみ出品ができること" do
      @item.price = '2222'
      expect(@item).to be_valid
    end

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

    it "category_idが空では出品できないこと" do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "shipping_cost_idが空では出品できないこと" do
      @item.shipping_cost_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
    end

    it "prefecture_idが空では出品できないこと" do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "shipping_days_idが空では出品できないこと" do
      @item.shipping_days_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping days can't be blank")
    end

    it "status_idが空では出品できないこと" do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it "priceが空では出品できないこと" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceは¥300未満だ出品できないこと" do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "priceは¥10000000以上だと出品できないこと" do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
  end
end
