class RemoveNavieraFromContenedor < ActiveRecord::Migration[5.1]
  def change
    remove_reference :containers, :naviera
  end
end
