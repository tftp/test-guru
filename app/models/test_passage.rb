class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_save_set_next_question

  TEST_LEVEL_PASS = 85

  def self.has_success?(user, test)
    test_passages_success =[]
    TestPassage.where(user_id: user.id, test_id: test.id).each do |test_passage|
      test_passages_success << test_passage if test_passage.success?(test_passage.result_in_persent)
    end
    return !test_passages_success.empty?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def completed?
    current_question.nil?
  end

  def result_in_persent
    self.correct_questions.to_f / self.count_all_questions * 100
  end

  def success?(result)
    result > TEST_LEVEL_PASS
  end

  def count_question
    test.questions.count - test.questions.order(:id).where('id > ?', current_question.id).count
  end

  def count_all_questions
    test.questions.count
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_save_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    answer_ids && (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

end
