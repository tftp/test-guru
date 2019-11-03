class CorrectReferenceQuestionsTests < ActiveRecord::Migration[6.0]
  def change
    remove_reference(:questions, :tests, foreign_key: false)
  end
end
