class CreateBixos < ActiveRecord::Migration
  def change
    create_table :bixos do |t|
      t.string :nome
      t.string :telefone
      t.string :email
      t.string :curso

      t.timestamps
    end
  end
end
