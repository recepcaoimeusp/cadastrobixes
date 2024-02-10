class Item < ApplicationRecord
  validates :nome, presence: true, uniqueness: true
  validates :preco, presence: true
  validates :quantidade, presence: true
  validates :eh_do_kit, inclusion: { in: [true, false] }

  has_many :bixe_items
  has_many :bixes, through: :bixe_items
end
