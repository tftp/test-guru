class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, inverse_of: :question
#  has_many :test_passages

  validates :body, presence: true
end
