class Venda < ActiveRecord::Base
  attr_accessible :completo, :cor_da_mochila, :valor, :bixo_id

  belongs_to :bixo
  has_many :pagamentos

  validates :valor, :presence => true
  validates :bixo_id, :presence => true

end
