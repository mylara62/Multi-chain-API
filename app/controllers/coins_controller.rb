class CoinsController < ApplicationController
	before_action :authenticate_user
	before_action :authenticate_admin_user

	def show;end

	def coin_generation
	end
	
	def coin_generated;end

	def coins_list
		@coins = @user.coins.all
	end
	
	def coin_generate
		if MultiChain.validateaddress(params[:issuer_address])
			transaction_address = MultiChain.issue(params[:issuer_address], params[:coin_name], params[:initial_supply].to_i)
			@user.coins.create(initial_supply: params[:initial_supply], 
												 issuer_address: params[:issuer_address], 
												 coin_name: params[:coin_name], 
												 miner_address: transaction_address)
			redirect_to coins_list_coins_path
		else
			flash.notice = "please pass valid wallet address"
		end
	end

	def coin_show
		@coin = Coin.find(params[:coin_id]) if params[:coin_id]
		@abi = MultiChain.listassets
	end

	def transactions
		@transactions = @user.coin_transactions.all
	end

	def send_coin;end

	def coin_send
		if MultiChain.validateaddress(params[:from_address]) && MultiChain.validateaddress(params[:to_address])
			transaction_address = MultiChain.sendassetfrom(params[:from_address], params[:to_address], params[:coin_name], params[:amount].to_i)
			@user.coin_transactions.create(from_address: params[:from_address], 
																			 to_address: params[:to_address], 
																			 coin_name: params[:coin_name], 
																			 amount: params[:amount], 
																			 action_type: params[:type], 
																			 info: params[:info], 
																			 tags: params[:tags], 
																			 message: params[:message],
																			 transactionhash: transaction_address)
			redirect_to transactions_coins_path
		else
			flash.notice = "please pass valid wallet address"
		end
	end

	def coin_transaction
		@transaction = CoinTransaction.find(params[:transaction_id])
	end

	def balances;end

	def balance_check
		if MultiChain.validateaddress(params[:wallet_address])
			balances = MultiChain.getaddressbalances(params[:wallet_address])
			@total_balance = balances.collect{|balance| balance["qty"]}.inject(0){|sum,x| sum + x }

			respond_to do |format|
				format.js
			end
		else
			flash.notice = "please pass valid wallet address"
		end
	end

	def search;end

	def get_search
    if MultiChain.validateaddress(params[:wallet_address])
    	@wallet_address = params[:wallet_address]
    	@history = MultiChain.listaddresstransactions(params[:wallet_address])
    	respond_to do |format|
    		format.js
    	end
    else
    	flash.notice = "please pass valid wallet address"
    end
	end
end