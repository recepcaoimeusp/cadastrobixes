class Venda < ActiveRecord::Base
  attr_accessible :cor_da_mochila, :bixo_id, :tamanho_camisa

  belongs_to :bixo
  has_many :pagamentos

  validates :bixo_id, :presence => true
  validates :tamanho_camisa, :presence => true

  PRECO = 80
  CUSTO = 63.48

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

  def valor_em interval
    total = 0
    pagamentos.where(created_at: interval).each do |pagamento|
      total += pagamento.valor
    end
    total
  end

  def self.preco
    PRECO
  end

  def self.custo
    CUSTO
  end

  def self.stats interval=(Time.new(2015,2,11)..Time.now)
    stats = {
      total: 0,
      partials: 0,
      vendas: 0,
      quitados: 0,
      vermelhos: 0,
      brancos: 0,
      camisetas: {
        "P" => 0, "M" => 0, "G" => 0, "GG" => 0,
        "Baby M" => 0, "Baby G" => 0, "Baby GG" => 0
      }
    }
    check = {}
    Venda.where(created_at: interval).each do |venda|
      stats[:vendas] += 1 
      stats[:vermelhos] += 1 if venda.cor_da_mochila == "Vermelha"
      stats[:brancos] += 1 if venda.cor_da_mochila == "Branca"
      stats[:camisetas][venda.tamanho_camisa] += 1
    end
    Pagamento.where(created_at: interval).each do |pagamento|
      valor = pagamento.valor
      total = pagamento.venda.valor_em interval
      stats[:total] += valor
      unless check[pagamento.venda_id]
        if total < PRECO
          stats[:partials] += valor
        else
          stats[:quitados] += 1
        end
        check[pagamento.venda_id] = true
      end
    end
    stats
  end

end
