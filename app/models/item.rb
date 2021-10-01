class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_day

  has_one_attached :image

  with_options presence: true do
  #商品画像を1枚つけることが必須であること。
  validates :image
  #商品名が必須であること。
  validates :item_name
  #商品の説明が必須であること。
  validates :item_description
  end

  with_options presence: true, numericality: { other_than: 0 , message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_day_id
  end

  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid" }
  
  #入力された価格によって、販売手数料や販売利益の表示が変わること。


end
