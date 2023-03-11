class Items < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :nome
      t.numeric :preco
      t.numeric :quantidade
      t.boolean :eh_do_kit

      t.timestamps
    end
  end
end
