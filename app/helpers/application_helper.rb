module ApplicationHelper

	def aescrypt_password(password)
		message = 'encrypt the password'
		AESCrypt.encrypt(password, message)
	end
end
