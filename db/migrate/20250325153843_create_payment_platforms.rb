class CreatePaymentPlatforms < ActiveRecord::Migration[8.0]
  def change
    create_table :payment_platforms do |t|
      t.string :name
      t.string :url_pattern

      t.timestamps
    end
  end
end
