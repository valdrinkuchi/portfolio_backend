Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :portfolio_transactions, :currencys
    end
  end
end
