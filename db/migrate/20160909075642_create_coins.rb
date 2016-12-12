class CreateCoins < ActiveRecord::Migration[5.0]
  def change
    create_table :coins do |t|
      t.integer :initial_supply
      t.string :coin_name
      t.string :issuer_address
      t.string :miner_address
      t.timestamps
    end
  end
end
