class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.boolean :status

      t.timestamps
    end
  end
end
