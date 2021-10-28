class PortfolioTransaction < ApplicationRecord
  belongs_to :currency
  validates :amount, :location, :date, presence: true
end
