class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :genre


  def self.search_for(content, method)
    if method == 'perfect'
      Item.where(title: content)
    elsif method == 'forward'
      Item.where('title LIKE ?', content + '%')
    elsif method == 'backward'
      Item.where('title LIKE ?', '%' + content)
    else
      Item.where('title LIKE ?', '%' + content + '%')
    end
  end
  has_one_attached :image
  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize: "#{width}x#{height}!").processed
  end

  def with_tax_price
   (price * 1.1).floor
  end

end
