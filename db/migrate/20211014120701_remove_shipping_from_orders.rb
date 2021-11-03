class RemoveShippingFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :shipping_id
  end
end
