class CorrectReferenceAnswersQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_reference(:answers, :questions, foreign_key: false)
  end
end
