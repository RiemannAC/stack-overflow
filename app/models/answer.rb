class Answer < ApplicationRecord
  validates_presence_of :content
  belongs_to :user
  belongs_to :question
end
