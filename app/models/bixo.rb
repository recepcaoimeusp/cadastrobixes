class Bixo < ActiveRecord::Base
  attr_accessible :curso, :email, :nome, :telefone

  has_many :vendas
  has_many :esporte_bixos

  validates :nome, :presence => true
  validates :curso, :presence =>true
  validates :email, :presence => true
  validates :telefone, :presence => true
end
