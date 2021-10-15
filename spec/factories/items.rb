FactoryBot.define do
  factory :item do
    item_name { Faker::Lorem.sentence }
    item_description { Faker::Lorem.sentence } # 商品の説明
    category_id { 1 } # カテゴリー
    condition_id { 1 } # 商品の状態
    shipping_cost_id { 1 } # 配送料
    prefecture_id { 1 } # 発送元地域
    shipping_day_id { 1 } # 発送までの日数
    price { 2000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
