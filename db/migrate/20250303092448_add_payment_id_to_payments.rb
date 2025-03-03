class AddPaymentIdToPayments < ActiveRecord::Migration[8.0]
  def change
    add_column :payments, :payment_id, :string
  end
end
