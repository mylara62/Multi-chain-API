class UsersController < ApplicationController
	before_action :register,only: [:user_session]
	before_action :authenticate_coin,only: [:admin]

	def register;end

	def admin;end

	def create
		user = User.find_by_password(params[:password])
		if user
			session[:address] = user.address 
			user.password.eql?("admin@multichain") ? (redirect_to admin_users_path) : (redirect_to coins_list_coins_path)
		else
			address = MultiChain.getnewaddress
			newuser = User.create(password: params[:password], address: address)
			session[:address] = newuser.address
			redirect_to coins_list_coins_path
		end
	end

	def access_allow
		user = User.find(params[:user_id])
		user.update(verified: true)
		MultiChain.connect_grant(user.address)
		MultiChain.send_grant(user.address)
		MultiChain.receive_grant(user.address)
		redirect_to :back
	end

	def destroy
		session[:address] = nil
		redirect_to register_users_path
	end
end