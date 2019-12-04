class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, inverse_of: :question
  belongs_to :gist

  validates :body, presence: true
end
