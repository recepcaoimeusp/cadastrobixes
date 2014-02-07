class Esporte < ActiveRecord::Base
  attr_accessible :modalidade

  has_many :esporte_bixos

  validates :modalidade, :presence => true

end
