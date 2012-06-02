class User < ActiveRecord::Base
  
  attr_accessible :username, :email, :password, :password_confirmation
  attr_accessor :password
  before_save :encrypt_password

  validates :username, :email,
    :presence => true, :uniqueness =>  true
    
  validates :password, :password_confirmation,
    :presence => true

  validates :password,
    :confirmation => true

  def self.authenticate(username, password)
    user = find_by_username(username)
    return nil unless user

    hash_provided = BCrypt::Engine.hash_secret(password, user.password_salt)

    if user.password_hash == hash_provided
      return user 
    else
      return nil
    end
  end

  private

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(
        password,
        password_salt
      )
    end
  end
end