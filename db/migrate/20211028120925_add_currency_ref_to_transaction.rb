class AddCurrencyRefToTransaction < ActiveRecord::Migration[6.1]
  def change
    add_reference :transactions, :currency, null: false, foreign_key: true
  end
end
