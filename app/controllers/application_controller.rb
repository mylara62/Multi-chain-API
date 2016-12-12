class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  def authenticate_user
  	@user = User.find_by_address(session[:address]) unless session[:address].blank?
  	session[:address].blank? ? (redirect_to register_users_path) : nil
  end

  def authenticate_admin_user
  	@user = User.find_by_address(session[:address]) unless session[:address].blank?
  	@user.password.eql?("admin@multichain") ? (redirect_to register_users_path) : nil
  end

  def authenticate_coin
  	@user = User.find_by_address(session[:address]) unless session[:address].blank?
  	@user.password.eql?("admin@multichain") ? nil : (redirect_to register_users_path)
  end

  def user_session
  	session[:address] = nil
  end
end
