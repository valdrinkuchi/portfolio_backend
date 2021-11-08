class Currency < ApplicationRecord
  has_many :portfolio_transactions, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
