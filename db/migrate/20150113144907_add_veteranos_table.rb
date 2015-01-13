class AddVeteranosTable < ActiveRecord::Migration
  def change
    create_table :veteranos, :force => true do |t|
      t.string   :nome
      t.string   :telefone
      t.string   :email
    end
  end
end
