class PaymentLink < ApplicationRecord
  belongs_to :profile
  belongs_to :payment_platform
end
