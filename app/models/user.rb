class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_create :generate_authentication_token
  validates_presence_of :name, :email, :password

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :question_upvotes, dependent: :destroy
  has_many :answer_upvotes, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorited_questions, through: :favorites, source: :question

  def admin?
    self.role == "admin"
  end

  def generate_authentication_token
    self.authentication_token = Devise.friendly_token
  end
end
