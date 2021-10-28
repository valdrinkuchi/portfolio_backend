module Api
  module V1
    class CurrencysController < ApplicationController
      def index
        currencies = Currency.order('created_at ASC')
        render json: { status: 'SUCCESS', message: 'Loaded transactions', data: currencies }, status: :ok
      end
    end
  end
end
