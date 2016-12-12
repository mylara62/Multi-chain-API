class Api::V1::CoinsController < ApplicationController
  def create
    if MultiChain.validateaddress(params[:issuer_address])
      coin = MultiChain.issue(params[:issuer_address], params[:coin_name], params[:initial_supply])
      render :json => {miner_address: coin, abi: MultiChain.listassets, coin_address: params[:issuer_address]}
    else 
      render :json => {message: "please enter valid issuer address"}
    end
  end

  def coin_send
    if MultiChain.validateaddress(params[:from_address]) && MultiChain.validateaddress(params[:to_address])
      transaction = MultiChain.sendassetfrom(params[:from_address], params[:to_address], params[:coin_name], params[:amount])
      render :json => {transactionhash: transaction, 
                       action_type: params[:action_type], 
                       action_info: params[:action_info], 
                       tags: params[:tags], 
                       message: params[:message], 
                       datetime: Time.now}
    else
      render :json => {message: "please pass valid wallet_addresses"}
    end
  end
  
  def history
    if MultiChain.validateaddress(params[:wallet_address])
      history = MultiChain.listaddresstransactions(params[:wallet_address])
      render :json => {history: history}
    else
      render :json => {message: "please pass valid wallet address"}
    end
  end

  def additional
    if MultiChain.validateaddress(params[:wallet_address]) && !params[:coin_name].blank?
      addtional_amount = MultiChain.sendassettoaddress(params[:wallet_address], params[:coin_name], params[:coin_amount])
      render :json => {}
    else
      render :json => {message: "please pass valid wallet address and coin name"}
    end
  end
end
