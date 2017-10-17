class CreateProduct < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :nombre
      t.string :referencia
      t.string :descripcion

      t.timestamps
    end
  end
end
