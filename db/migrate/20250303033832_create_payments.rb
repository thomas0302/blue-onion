class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.references :order, null: false, foreign_key: true
      t.decimal :payment_amount
      t.datetime :paid_at

      t.timestamps
    end
  end
end
