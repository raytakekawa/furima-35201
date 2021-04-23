FactoryBot.define do
  factory :order_destination do
    post_code {"000-0000"}
    prefecture_id { 2 }
    city {"東京都"}
    address {"港区"}
    phone_number { '00000000000' }
    token {"tok_abcdefghijk00000000000000000"}
    item_id { 3 }
    association :user
  end
end