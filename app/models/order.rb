class Order < ApplicationRecord
 has_many :order_details, dependent: :destroy
 belongs_to :customers

 #enumの定義　支払い方法、注文ステータス
 enum payment_method: { credit_card: 0, transfer: 1 }
 enum status: { waiting: 0, confirmation: 1, creationg: 2, preparing: 3, delivered: 4 }
end
