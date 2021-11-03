class AddBillToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :bill, :integer
  end
end
