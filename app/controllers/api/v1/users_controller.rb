class Api::V1::UsersController < ApplicationController
  def create
    if params[:password].blank?
      render :json => {message: "Password should not be blank."} and return
    end
    user = User.find_by_password(params[:password])
    if user.present?
      render :json => {address: user.address}
    else
      address = MultiChain.getnewaddress
      user = User.create(password: params[:password], address: address)
      render :json => {address: user.address}
    end
  end
end