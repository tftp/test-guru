class Answer < ApplicationRecord
  belongs_to :question

  scope :true_answers, -> {where(correct: true)}

  validates :body, presence: true
  validate :include_answers

  private

  def include_answers
    errors.add(:question) unless question.answers.count.in?(1..4)
  end

end
