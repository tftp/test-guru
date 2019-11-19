module TestPassagesHelper

  def result_in_persent(test_passage)
    part = test_passage.correct_questions
    all = 0
    test_passage.test.questions.each do |question|
      all += question.answers.correct.count
    end
    unless all.zero?
      persent = part*100/all
    else
      persent = 0
    end
  end

end
