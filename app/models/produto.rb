class Produto < ApplicationRecord
  has_many :linha_items

  before_destroy :assegure_nao_referenciado_por_alguma_linha_item

  validates :titulo, :image_url, presence: true
  validates :preco, numericality: {greater_than_or_equal_to: 0.01}
  validates :titulo, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'é necessário que a URL seja .gif, .jpg ou .png'
  }

  private

    def assegure_nao_referenciado_por_alguma_linha_item
      unless linha_items.empty?
        errors.add(:base, 'Linha items presente')
        throw :abort
      end
    end
end
