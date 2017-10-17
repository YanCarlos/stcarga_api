class AddNavieraToContainer < ActiveRecord::Migration[5.1]
  def change
    remove_column :containers, :naviera
    add_reference :containers, :naviera, index: true
  end
end
