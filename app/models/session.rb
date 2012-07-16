class Session

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :username, :password, :user

  validates :username, :password,
    :presence => true

  validate :authenticate

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def authenticate
    unless username.blank? or password.blank?
      self.user = User.authenticate(username, password)
      errors.add(:base, "Username and password combination is invalid") unless self.user
    end
  end
  
end