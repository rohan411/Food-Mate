class User < ActiveRecord::Base
  # attr_accessible :email, :password, :password_confirmation

  
  validates_presence_of :phone
  validates_uniqueness_of :phone

  has_secure_password
  # attr_accessible :email, :password, :password_confirmation


end
