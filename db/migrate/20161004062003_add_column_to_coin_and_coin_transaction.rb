class AddColumnToCoinAndCoinTransaction < ActiveRecord::Migration[5.0]
  def change
  	add_column :coins,:user_id,:integer
  	add_column :coin_transactions,:user_id,:integer
  	add_column :coin_transactions,:transactionhash,:string
  	rename_column :coin_transactions, :type, :action_type
  end
end
