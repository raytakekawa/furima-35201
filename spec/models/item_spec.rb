require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

  it "name、description、image、shipping_cost、prefecture、shipping_days、status_id、priceが存在すれば登録ができること" do
    expect(@item).to be_valid
  end  
end
