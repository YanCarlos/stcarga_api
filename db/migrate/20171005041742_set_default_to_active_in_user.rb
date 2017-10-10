class SetDefaultToActiveInUser < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :activo, :boolean, :default => false
  end
end
