class AddCursoOutroToBixos < ActiveRecord::Migration
  def change
    add_column :bixos, :curso_outro, :string
  end
end
