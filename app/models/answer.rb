class Answer < ApplicationRecord
  belongs_to :question, inverse_of: :answers

  scope :true_answers, -> {where(correct: true)}

  validates :body, presence: true

end
