class CreateBixesItemsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :bixes_items do |t|
      t.references :bixe, null: false, foreign_key: true, index: true
      t.references :item, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
