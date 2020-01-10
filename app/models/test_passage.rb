class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  #before_validation :before_validation_set_timedown, on: :create
  #before_update :before_save_set_next_question

  TEST_LEVEL_PASS = 85
  SECONDS_IN_MINUTE = 60

  def self.has_success?(user, test)
    !TestPassage.where(user_id: user.id, test_id: test.id, success: true).empty?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    before_save_set_next_question
    save!
  end

  def completed?
    current_question.nil?
  end

  def result_in_persent
    (self.correct_questions.to_f / self.count_all_questions * 100).to_i
  end

  def success?
    self.result_in_persent > TEST_LEVEL_PASS
  end

  def count_question
    test.questions.count - test.questions.order(:id).where('id > ?', current_question.id).count
  end

  def count_all_questions
    test.questions.count
  end

  def is_timeout?
    !self.timedown.positive?
  end

  def timedown
    (self.created_at + test.timeset * SECONDS_IN_MINUTE - Time.now).to_i
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  #def before_validation_set_timedown
  #  return if test.timeset.zero?
  #  self.timedown = test.timeset * SECONDS_IN_MINUTE
  #end

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
    test.questions.order(:id).where('id > ?', current_question.id).first if current_question
  end

end
