class BixeItem < ApplicationRecord
  validates :quantity, presence: true

  belongs_to :bixe
  belongs_to :item
end
