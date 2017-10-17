class ChangeFieldInContainer < ActiveRecord::Migration[5.1]
  def change
    rename_column :containers, :fecha_entrada, :fecha_devolucion
    rename_column :containers, :fecha_limite_salida, :fecha_limite_devolucion
  end
end
