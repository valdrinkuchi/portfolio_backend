module Presenters
  class TransactionPresenter
    def initialize(transaction)
      @transaction = transaction
      @rate_data = Api::RestApi.new.call
      @currency_code = transaction.currency.code
    end

    def call
      case currency_code
      when 'BTC'
        compute_transaction_for('BTC')
      when 'ETH'
        compute_transaction_for('ETH')
      when 'XRP'
        compute_transaction_for('XRP')
      end
    end

    private

    attr_reader :transaction, :rate_data, :currency_code

    def compute_transaction_for(crypto)
      {
        id: transaction.id,
        amount: transaction.amount,
        location: transaction.location,
        currency: transaction.currency,
        date: transaction.date.strftime('%Y/%m/%d'),
        created_at: transaction.created_at,
        updated_at: transaction.updated_at,
        market_value: (transaction.amount * rate_data[crypto]).ceil(2)
      }
    end
  end
end
