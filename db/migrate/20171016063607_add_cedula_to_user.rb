class AddCedulaToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :cedula, :string, :default => nil
  end
end
