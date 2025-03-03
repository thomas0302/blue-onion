class JournalEntriesController < ApplicationController
    def index
      # Sanitize the month input to remove any unwanted characters
      month = params[:month].to_s.gsub(/[^0-9-]/, '') || Date.today.strftime("%Y-%m")
  
      begin
        start_date = Date.parse("#{month}-01")
      rescue ArgumentError
        return render json: { error: "Invalid month format" }, status: 400
      end
  
      end_date = start_date.end_of_month
      orders = Order.where(ordered_at: start_date..end_date)
  
      journal_entries = {
        accounts_receivable: { debit: 0, credit: 0 },
        revenue: { debit: 0, credit: 0 },
        shipping_revenue: { debit: 0, credit: 0 },
        sales_tax_payable: { debit: 0, credit: 0 },
        cash: { debit: 0, credit: 0 }
      }
  
      orders.each do |order|
        sales = order.order_items.sum { |item| item.price_per_item * item.quantity }
        taxes = sales * order.tax_rate
        shipping = order.shipping
        payments = order.payments.sum(&:payment_amount)
  
        journal_entries[:accounts_receivable][:debit] += (sales + taxes + shipping)
        journal_entries[:cash][:debit] += payments
  
        journal_entries[:revenue][:credit] += sales
        journal_entries[:shipping_revenue][:credit] += shipping
        journal_entries[:sales_tax_payable][:credit] += taxes
        journal_entries[:accounts_receivable][:credit] += payments
      end
  
      render json: {
        month: month,
        journal_entries: journal_entries
      }
    end
  end
  