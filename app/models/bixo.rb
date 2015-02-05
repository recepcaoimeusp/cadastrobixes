class Bixo < ActiveRecord::Base
  attr_accessible :curso, :email, :nome, :telefone, :curso_outro

  has_many :vendas, :dependent => :destroy
  has_many :esporte_bixos, :dependent => :destroy

  validates :nome, :presence => true
  validates :curso, :presence =>true
  validates :email, :presence => true
  validates :telefone, :presence => true
end
