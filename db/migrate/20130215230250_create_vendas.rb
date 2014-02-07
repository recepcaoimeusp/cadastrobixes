class CreateVendas < ActiveRecord::Migration
  def change
    create_table :vendas do |t|
      t.string :nome
      t.string :cor_da_mochila
      t.integer :valor
      t.string :email
      t.string :telefone
      t.string :curso_turma
      t.boolean :completo

      t.timestamps
    end
  end
end
