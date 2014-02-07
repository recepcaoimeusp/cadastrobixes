class EsporteBixo < ActiveRecord::Base
  attr_accessible :bixo_id, :esporte_id

  belongs_to :bixo
  belongs_to :esporte

  validates :bixo_id, :presence => :true
  validates :esporte_id, :presence => :true
end
