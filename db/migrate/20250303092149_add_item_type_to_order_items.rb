class AddItemTypeToOrderItems < ActiveRecord::Migration[8.0]
  def change
    add_column :order_items, :item_type, :string
  end
end
