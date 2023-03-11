class Item < ApplicationRecord
  validates :nome, presence: true, uniqueness: true
  validates :preco, presence: true
  validates :quantidade, presence: true
  validates :eh_do_kit, inclusion: { in: [true, false] }

  has_and_belongs_to_many :bixes
end
