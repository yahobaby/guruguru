class CreateCreditCardPayments < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_card_payments do |t|
      t.integer :user_id
      t.integer :price  ,null: false #町内会金額データベース
      t.string :name
      t.integer :period
      t.string :note
      t.timestamps
    end
  end
end
