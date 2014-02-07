
class Pagamento < ActiveRecord::Base
  attr_accessible :valor, :responsavel, :venda_id

  belongs_to :venda

  validates :valor, :presence => true
  validates :responsavel, :presence => true
  validates :venda_id, :presence => true

end

