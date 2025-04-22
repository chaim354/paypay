class AddLogoUrlToPaymentPlatforms < ActiveRecord::Migration[8.0]
  def change
    add_column :payment_platforms, :logo_url, :string
  end
end
