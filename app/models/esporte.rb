class Esporte < ActiveRecord::Base
  attr_accessible :modalidade

  validates :modalidade, :presence => true
end
