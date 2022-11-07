class ShippingAdress < ApplicationRecord

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :city
    validates :address1
    validates :telephone, format: { with: /\A\d{11}\z/ }
  end
  
  belongs_to :order

end
