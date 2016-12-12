class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :password
      t.text :address

      t.timestamps
    end
  end
end
