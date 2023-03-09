class Item < ApplicationRecord
  validates :nome, presence: true, uniqueness: true
  validates :preco, presence: true
  has_and_belongs_to_many :bixes
end
