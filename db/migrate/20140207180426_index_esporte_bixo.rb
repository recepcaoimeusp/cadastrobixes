class IndexEsporteBixo < ActiveRecord::Migration
  def change
  	add_index :esporte_bixos, :bixo_id
  	add_index :esporte_bixos, :esporte_id
  end
end
