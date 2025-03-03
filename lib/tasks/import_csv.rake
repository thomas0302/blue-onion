require 'csv' # Ensure CSV is required before using it

namespace :import do
  desc "Import orders from CSV"
  task orders: :environment do
    filepath = Rails.root.join('db', 'data.csv')

    CSV.foreach(filepath, headers: true) do |row|
      order = Order.find_or_create_by!(
        order_id: row["order_id"],
        ordered_at: row["ordered_at"],
        shipping: row["shipping"],
        tax_rate: row["tax_rate"]
      )

      OrderItem.create!(
        order: order,
        item_type: row["item_type"],
        price_per_item: row["price_per_item"],
        quantity: row["quantity"]
      )

      # Handle multiple payments
      if row["payment_1_id"].present?
        Payment.create!(
          order: order,
          payment_id: row["payment_1_id"],
          payment_amount: row["payment_1_amount"]
        )
      end

      if row["payment_2_id"].present? && row["payment_2_id"] != "0"
        Payment.create!(
          order: order,
          payment_id: row["payment_2_id"],
          payment_amount: row["payment_2_amount"]
        )
      end
    end

    puts "CSV data imported successfully!"
  end
end
