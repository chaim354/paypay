json.extract! payment_link, :id, :paymentplatform_id, :payid, :created_at, :updated_at
json.url payment_link_url(payment_link, format: :json)
