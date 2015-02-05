class User < ActiveRecord::Base
	attr_accessor :password, :password_confirmation
	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

	validates :first_name, presence: true, length: { maximum: 30 }
  	validates :last_name, presence: true, length: { maximum: 30 }
  	validates :email, presence: true, format: { with: email_regex }, uniqueness: { case_sensitive: false }
  	validates :password, presence: true, confirmation: true, length: { within: 4..100 }

  	before_save :encrypt_password



  	private
  	def encrypt_password
  		self.salt = Digest::SHA2.hexdigest("#{Time.now.utc}--#{self.password}") if self.new_record?
  		self.encrypted_password = encrypt(self.password)
  	end
  	def encrypt(pass)
  		Digest::SHA2.hexdigest("#{self.salt}--#{pass}")
  	end
end
