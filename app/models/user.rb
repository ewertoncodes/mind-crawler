class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String

  validates_presence_of :name,  :email, :password


  has_secure_password
end
