class CreateEsportes < ActiveRecord::Migration
  def change
    create_table :esportes do |t|
      t.string :modalidade

      t.timestamps
    end
  end
end
