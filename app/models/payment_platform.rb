class PaymentPlatform < ApplicationRecord
  has_many :payment_links
  validates :name, presence: true, uniqueness: true
  validates :url_pattern, presence: true
end
