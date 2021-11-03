class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.boolean :order_status
      t.references :user, foreign_key: true
      t.references :payment, foreign_key: true
      t.references :shipping, foreign_key: true

      t.timestamps
    end
  end
end
