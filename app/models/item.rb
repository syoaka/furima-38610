class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :pay_for_shipping
  belongs_to :prefecture
  belongs_to :shipping_day

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :condition_id
    validates :pay_for_shipping_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price
  end

  
  validates :category_id,         numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :pay_for_shipping_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,       numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id,     numericality: { other_than: 1 , message: "can't be blank"}
end
