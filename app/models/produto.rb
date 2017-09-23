class Produto < ApplicationRecord
  validates :titulo, :image_url, presence: true
  validates :preco, numericality: {greater_than_or_equal_to: 0.01}
  validates :titulo, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'é necessário que a URL seja .gif, .jpg ou .png'
  }
end
