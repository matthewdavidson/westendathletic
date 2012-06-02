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

  def self.find_by_username_and_password(username, password)
    user = find_by_username(username)
    hash_provided = BCrypt::Engine.hash_secret(password, user.password_salt)
    return user if user && user.password_hash == hash_provided
    nil
  end

  def self.find_by_email_and_password(email, password)
    user = find_by_email(email)
    hash_provided = BCrypt::Engine.hash_secret(password, user.password_salt)
    return user if user && user.password_hash == hash_provided
    nil
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