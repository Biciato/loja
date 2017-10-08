class Usuario < ApplicationRecord
  validates :nome, presence: true, uniqueness: true
  has_secure_password
end
