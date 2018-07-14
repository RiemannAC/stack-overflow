class Question < ApplicationRecord
  belongs_to :user, counter_cache: true
  validates_presence_of :content, :title
end
