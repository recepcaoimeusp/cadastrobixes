class CreatePagamentosTable < ActiveRecord::Migration
  def change
    create_table :pagamentos, :force => true do |t|
      t.integer  :valor
      t.string   :responsavel
      t.integer  :venda_id
    end

    add_index :pagamentos, [:venda_id], :name => :index_pagamentos_on_venda_id

    remove_column :vendas, :valor
    remove_column :vendas, :completo
  end
end
