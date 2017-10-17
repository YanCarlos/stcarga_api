class CreateNaviera < ActiveRecord::Migration[5.1]
  def change
    create_table :navieras do |t|
      t.string :nombre
      t.string :telefono
      t.string :nota
    end
  end
end
