module BitCoinPatch
	# List of assets address
  def listpermissions
    @api.request 'listpermissions'
  end
  # Validate address
  def validateaddress(address)
    @api.request "validateaddress", address
  end
  # Coin Generation
  def listassets
    @api.request 'listassets'
  end
  # Log Search
  def listaddresstransactions(address)
    @api.request 'listaddresstransactions', address
  end
  # Send Coin
  def issue(wallet_address, asset_identifier, asset_qty)
  	@api.request 'issue', wallet_address, asset_identifier, asset_qty
  end
  # Account Balance Check
  def getaddressbalances(coin_address)
  	@api.request 'getaddressbalances', coin_address, minconf = 1
  end
  # Send Coin
  def sendassetfrom(from_address, to_address, asset_identifier, asset_qty)
  	@api.request 'sendassetfrom', from_address, to_address, asset_identifier, asset_qty
  end
  # Send Assets to Address
  def sendassettoaddress(wallet_address, asset_identifier, asset_qty)
    @api.request 'sendassettoaddress', wallet_address, asset_identifier, asset_qty
  end
  # Connect permission for wallet address
  def connect_grant(wallet_address)
    @api.request 'grant', wallet_address, "connect"
  end
  # Send permission for wallet address
  def send_grant(wallet_address)
    @api.request 'grant', wallet_address, "send"
  end
  # Receive permission for wallet address
  def receive_grant(wallet_address)
    @api.request 'grant', wallet_address, "receive"
  end
end
