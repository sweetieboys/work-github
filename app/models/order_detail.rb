class OrderDetail < ApplicationRecord
  belongs_to :orders
  belongs_to :items

  #enumの定義　製造ステータス
  enum making_status: { fuka: 0, mati: 1, making: 2, complete: 3 }
end
