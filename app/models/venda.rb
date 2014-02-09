class Venda < ActiveRecord::Base
  attr_accessible :cor_da_mochila, :bixo_id, :tamanho_camisa

  belongs_to :bixo
  has_many :pagamentos

  validates :bixo_id, :presence => true
  validates :tamanho_camisa, :presence => true

  PRECO = 75

  def valor
    total = 0
    pagamentos.each do |pagamento|
      total += pagamento.valor
    end
    total
  end

  def completo?
    return valor >= PRECO
  end

end
