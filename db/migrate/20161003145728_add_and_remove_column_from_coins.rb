class AddAndRemoveColumnFromCoins < ActiveRecord::Migration[5.0]
  def change
  	remove_column :coins,:to_address,:string
  	add_column :coins,:miner_address,:string
  end
end
