class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.text :name
      t.string :description
      t.integer :price
      t.binary :image
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
