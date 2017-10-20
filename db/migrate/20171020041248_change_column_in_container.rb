class ChangeColumnInContainer < ActiveRecord::Migration[5.1]
  def change
    add_column :containers, :ingreso_a_bodega, :date
    rename_column :containers, :fecha_entrega, :inicio_de_mora
  end
end
