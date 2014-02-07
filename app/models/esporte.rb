class Esporte < ActiveRecord::Base
  attr_accessible :modalidade

  has_many :esporte_bixos, :dependent => :destroy

  validates :modalidade, :presence => true

end
