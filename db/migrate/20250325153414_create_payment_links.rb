class CreatePaymentLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :payment_links do |t|
      t.references :payment_platform, null: false, foreign_key: true
      t.string :payid
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
