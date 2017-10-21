class AddRepresentanteToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nombre_contacto, :string
    add_column :users, :telefono_contacto, :string
  end
end
