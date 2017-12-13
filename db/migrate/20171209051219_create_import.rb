class CreateImport < ActiveRecord::Migration[5.1]
  def change
    create_table :imports do |t|
      t.string :codigo
      t.date :fecha
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
