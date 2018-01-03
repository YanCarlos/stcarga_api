class CreateDispatch < ActiveRecord::Migration[5.1]
  def change
    create_table :dispatches do |t|
      t.string :codigo
      t.date :fecha
      t.references :import, foreign_key: true
      t.string :contacto
      t.string :telefono1
      t.string :telefono2
      t.string :descripcion
      t.string :direccion
      t.string :ciudad
      t.timestamps
    end
  end
end
