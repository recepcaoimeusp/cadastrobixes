class CreateBixeItem < ActiveRecord::Migration[7.0]
  def change
    create_table :bixe_items do |t|
      t.references :bixe, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :quantity, null: false, default: 1

      t.timestamps
    end
  end
end
