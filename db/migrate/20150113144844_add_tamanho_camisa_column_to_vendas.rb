class AddTamanhoCamisaColumnToVendas < ActiveRecord::Migration
  def change
    add_column :vendas, :tamanho_camisa, :string
  end
end
