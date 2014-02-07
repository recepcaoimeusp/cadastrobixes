class RelateBixosVendas < ActiveRecord::Migration
  def change
  	remove_column :vendas, :nome
  	remove_column :vendas, :email
  	remove_column :vendas, :telefone
  	remove_column :vendas, :curso_turma
  	add_column :vendas, :bixo_id, :integer
    add_index :vendas, :bixo_id
  end
end
