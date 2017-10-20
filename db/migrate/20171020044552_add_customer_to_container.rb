class AddCustomerToContainer < ActiveRecord::Migration[5.1]
  def change
    add_reference :containers, :user, index: true
  end
end
