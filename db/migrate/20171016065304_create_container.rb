class CreateContainer < ActiveRecord::Migration[5.1]
  def change
    create_table :containers do |t|
      t.string :codigo
      t.boolean :entregado, :default => false
      t.date :fecha_entrada
      t.date :fecha_limite_salida
      t.date :fecha_entrega
      t.string :naviera

      t.timestamps
    end
  end
end
