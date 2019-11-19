class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> {where(correct: true)}

  validates :body, presence: true
  validate :include_answers

  private

  def include_answers
    errors.add(:question) if question.answers.count > 3
  end

end
