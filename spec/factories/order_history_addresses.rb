FactoryBot.define do
  factory :order_history_address do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '札幌市' }
    house_number { 'あいう1-2-3' }
    building_name { 'ハイツ101' } #必要？
    telephone_number { '08012345678' }
  end
end
