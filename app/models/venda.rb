class Venda < ActiveRecord::Base
  attr_accessible :completo, :cor_da_mochila, :curso_turma, :email, :nome, :telefone, :valor
  
  validates :nome, :presence => true
  validates :curso_turma, :presence =>true
  validates :email, :presence => true
  validates :telefone, :presence => true
  validates :valor, :presence => true
  
end
