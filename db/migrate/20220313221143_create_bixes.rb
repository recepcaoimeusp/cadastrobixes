class CreateBixes < ActiveRecord::Migration[7.0]
  def change
    create_table :bixes do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.integer :curso

      t.timestamps
    end
  end
end
