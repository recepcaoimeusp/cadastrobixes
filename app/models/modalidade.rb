class Modalidade < ApplicationRecord
  validates :nome, presence: true, uniqueness: true
  has_and_belongs_to_many :bixes
end
