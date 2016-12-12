class BalancesController < ApplicationController
	def create
    if MultiChain.validateaddress(params[:wallet_address])
      balances = MultiChain.getaddressbalances(params[:wallet_address])
      total_balace = balances.collect{|balance| balance["qty"]}.inject(0){|sum,x| sum + x }
      render :json => {balance: total_balace}
    else
      render :json => {message: "please enter valid addresses"}
    end
  end
end
