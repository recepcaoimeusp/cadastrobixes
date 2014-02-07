class Veterano < ActiveRecord::Base
  attr_accessible :email, :nome, :telefone

  validates :nome, :presence => true
  validates :email, :presence => true
  validates :telefone, :presence => true
end
