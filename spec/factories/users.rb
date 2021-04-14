FactoryBot.define do
  factory :user do
    nickname {"sample"}
    email {Faker::Internet.email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name {"山田"}
    first_name {"太郎"}
    last_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    birth_date {"2020-01-01"}
    # nickname {"yogo"}
    # email {"yogo@exmaple.com"}
    # password {"000000a"}
    # password_confirmation {"000000a")
  end
end

# 出品者 = FactoryBot.create(:user)
# 購入者 = FactoryBot.create(:user)