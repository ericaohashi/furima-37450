class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user

  belongs_to :category
  belongs_to :prefecture
  belongs_to :schedule
  belongs_to :ship_fee
  belongs_to :item_status
  has_one :purchase
  has_one_attached :image

  validates :category_id,:prefecture_id,:schedule_id,:ship_fee_id,:item_status_id ,numericality: { other_than: 1 ,message: "cant't be blank"}
  validates :image, presence: true
  validates :price, presence: true,format:{ with:/\A[0-9]+\z/},numericality: {only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
end
