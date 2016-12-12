class User < ApplicationRecord	
	has_many :coins, dependent: :destroy
	has_many :coin_transactions, dependent: :destroy
end
