class Items < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :nome
      t.numeric :preco

      t.timestamps
    end
  end
end
