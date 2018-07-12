class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_create :generate_authentication_token
  validates_presence_of :name, :email, :password

  def admin?
    self.role == "admin"
  end

  def generate_authentication_token
    self.authentication_token = Devise.friendly_token
  end
end
