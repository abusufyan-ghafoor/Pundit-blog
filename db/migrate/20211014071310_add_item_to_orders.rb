class AddItemToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :item, :integer
  end
end
