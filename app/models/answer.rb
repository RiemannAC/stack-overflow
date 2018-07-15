class Answer < ApplicationRecord
  validates_presence_of :content
  belongs_to :user
  belongs_to :question, counter_cache: true
  has_many :answer_upvotes, dependent: :destroy
end
