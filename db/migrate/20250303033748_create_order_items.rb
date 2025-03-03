class CreateOrderItems < ActiveRecord::Migration[8.0]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.decimal :price_per_item
      t.integer :quantity

      t.timestamps
    end
  end
end
