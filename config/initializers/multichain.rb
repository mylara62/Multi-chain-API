MultiChain = Bitcoin(Rails.application.secrets.multichain["username"], 
	Rails.application.secrets.multichain["password"], 
	:host => Rails.application.secrets.multichain["host"], 
	:port => Rails.application.secrets.multichain["port"], 
	:ssl => Rails.application.secrets.multichain["ssl"])

require 'bitcoin_client_patch'

Bitcoin::Client.class_eval{ include BitCoinPatch }