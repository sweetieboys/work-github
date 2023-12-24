class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  #enumの定義　製造ステータス
  enum making_status: { fuka: 0, mati: 1, making: 2, complete: 3 }
end
