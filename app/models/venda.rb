class Venda < ActiveRecord::Base
  attr_accessible :cor_da_mochila, :bixo_id, :tamanho_camisa

  belongs_to :bixo
  has_many :pagamentos

  validates :bixo_id, :presence => true
  validates :tamanho_camisa, :presence => true

  PRECO = 80

  def valor
    total = 0
    pagamentos.each do |pagamento|
      total += pagamento.valor
    end
    total
  end

  def divida
    return [0, PRECO - valor].max
  end

  def completo?
    return valor >= PRECO
  end

  def hora
    created_at.in_time_zone("Brasilia").strftime "%H:%M - %d/%m/%y"
  end

  def self.stats
    stats = {
      total: 0,
      partials: 0,
      vendas: 0,
      quitados: 0,
      vermelhos: 0,
      brancos: 0
    }
    Venda.all.each do |venda|
      valor = venda.valor
      stats[:total] += valor
      stats[:vendas] += 1
      if valor < PRECO
        stats[:partials] += valor
      else
        stats[:quitados] += 1
      end
      stats[:vermelhos] += 1 if venda.cor_da_mochila == "Vermelha"
      stats[:brancos] += 1 if venda.cor_da_mochila == "Branca"
    end
    stats
  end

end
