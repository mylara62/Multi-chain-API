class CreateCoinTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :coin_transactions do |t|
      t.string :from_address
      t.string :to_address
      t.string :coin_name
      t.string :amount
      t.string :type
      t.string :info
      t.string :tags
      t.string :message
      t.timestamps
    end
  end
end
