module Api
  module V1
    class PortfolioTransactionsController < ApplicationController
      # GET/ProtfolioTransactions
      def index
        transactions = PortfolioTransaction.order('created_at ASC')
        data = transactions.map { |t| data_presenter(t) }
        render json: { status: 'SUCCESS', message: 'Loaded transactions', data: data }, status: :ok
      end

      # CREATE new transactions
      def create
        transaction = PortfolioTransaction.create(portfolio_transaction_params)
        currency = Currency.find_by(name: params[:currency])
        date = transaction.date
        transaction.date = date.presence ? date : Time.now.utc
        transaction.currency = currency
        if transaction.save
          data = data_presenter(transaction)
          render json: { status: 'SUCCESS', message: 'Saved transaction', data: data }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Transaction could not be saved', data: data },
                 status: :unprocessable_entity
        end
      end

      # DELETE a Transaction
      def destroy
        transaction = PortfolioTransaction.find(params[:id])
        transaction.destroy
        render json: { status: 'SUCCESS', message: 'Transaction deleted', data: transaction }, status: :ok
      end

      private

      def data_presenter(transaction)
        Presenters::TransactionPresenter.new(transaction).call
      end

      def portfolio_transaction_params
        params.permit(:amount, :location, :date)
      end
    end
  end
end
