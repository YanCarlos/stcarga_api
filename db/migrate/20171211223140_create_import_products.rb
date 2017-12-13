class CreateImportProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :import_products do |t|
      t.references :import, foreign_key: true
      t.references :product, foreign_key: true
      t.string :identificacion
      t.references :container, foreign_key: true
      t.decimal :paquetes
      t.decimal :unidad_por_paquete
      t.decimal :total_unidades
      t.decimal :total_paquete
      t.decimal :peso_neto
      t.decimal :peso_bruto
    end
  end
end
