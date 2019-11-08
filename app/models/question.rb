class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validate :include_answers

  private

  def include_answers
    errors.add(:answers) unless answers.count.in?(1..4)
  end
end
