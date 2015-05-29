class User < ActiveRecord::Base
  # attr_accessible :email, :password, :password_confirmation
  
  # attr_accessor :password
  # before_save :encrypt_password
  has_one :user_choice
  validates_presence_of :phone
  validates_uniqueness_of :phone

  has_secure_password
  # attr_accessible :email, :password, :password_confirmation


end
