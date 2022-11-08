class OrderAddress
  include ActiveModel::Model
  attr_accessor :number, :exp_month, :exp_year, :cvc, :post_code, :prefecture_id, :city, :address1, :address2, :telephone, :order_id, :user_id, :item_id
 
  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" }
    validates :city
    validates :address1
    validates :telephone, format: { with: /\A\d{11}\z/ }
    validates :user_id
    validates :item_id
  end


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address1: address1, address2: address2, telephone: telephone, order_id: order.id)
  end

end