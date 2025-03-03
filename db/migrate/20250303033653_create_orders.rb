class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.datetime :ordered_at
      t.decimal :tax_rate
      t.decimal :shipping

      t.timestamps
    end
  end
end
