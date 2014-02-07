class CreateEsporteBixos < ActiveRecord::Migration
  def change
    create_table :esporte_bixos do |t|
      t.integer :bixo_id
      t.integer :esporte_id

      t.timestamps
    end
  end
end
