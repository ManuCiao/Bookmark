require_relative 'data_mapper_setup'
require 'bcrypt'

class User

  attr_accessor :password, :password_confirmation

  include DataMapper::Resource

  property :id,             Serial
  property :username,       String
  property :email,          String
  property :crypted_pass,   Text

  validates_confirmation_of :password

  def crypt_password=(password)
      @password = password
      self.crypted_pass = BCrypt::Password.create(password) if password
  end

end
