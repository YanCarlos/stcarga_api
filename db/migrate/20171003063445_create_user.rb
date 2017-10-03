class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :telefono
      t.string :email
      t.string :direccion
      t.string :password
      t.boolean :activo

      t.timestamps
    end
  end
end
