class AddCurrencyRefToPortfolioTransaction < ActiveRecord::Migration[6.1]
  def change
    add_reference :portfolio_transactions, :currency, null: false, foreign_key: true
  end
end
