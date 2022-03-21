class PurchasesShipping
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post, :prefecture_id, :city, :address, :building, :phone, :purchase, :token

  with_options presence: true do
    validates :post, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :address
    validates :phone, format: {with:/\A\d{10,11}\z/}
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)

    Shipping.create(post: post,prefecture_id: prefecture_id,city: city,address: address,building: building,phone: phone,purchase_id: purchase.id)
  end
end


