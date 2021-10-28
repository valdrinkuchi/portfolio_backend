class CreatePortfolioTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :portfolio_transactions do |t|
      t.float :amount
      t.string :location
      t.datetime :date

      t.timestamps
    end
  end
end
