class Usuario < ApplicationRecord
  after_destroy :assegure_uma_permanencia_de_admin
  validates :nome, presence: true, uniqueness: true
  has_secure_password

  class Error < StandardError
  end

  private

    def assegure_uma_permanencia_de_admin
      if usuario.count.zero?
        raise Error.new "Não é permitido deletar o último usuário"
      end
    end
end
