class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, inverse_of: :question, dependent: :destroy
  has_many :gists, dependent: :destroy

  validates :body, presence: true
end
