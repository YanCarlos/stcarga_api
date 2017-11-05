class CreateDriver < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers do |t|
      t.string :nombre
      t.string :cedula
      t.string :placa
      t.string :telefono
      t.string :trailer

      t.timestamps
    end
  end
end
