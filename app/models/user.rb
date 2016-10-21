require_relative 'data_mapper_setup'
require 'bcrypt'

class User

  attr_accessor :password

  include DataMapper::Resource

  property :id,             Serial
  property :username,       String
  property :email,          String
  property :crypted_pass,   Text

  def crypt_password=(password)
      self.crypted_pass = BCrypt::Password.create(password) if password
  end

end
