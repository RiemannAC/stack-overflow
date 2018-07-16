class Question < ApplicationRecord
  belongs_to :user, counter_cache: true
  validates_presence_of :content, :title
  has_many :answers, dependent: :destroy
  has_many :question_upvotes, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  def is_favorited?(user)
    self.favorited_users.include?(user)
  end
end
