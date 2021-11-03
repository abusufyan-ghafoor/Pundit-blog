class CreateShippings < ActiveRecord::Migration[5.1]
  def change
    create_table :shippings do |t|
      t.boolean :status

      t.timestamps
    end
  end
end
