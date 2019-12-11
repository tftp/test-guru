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

  def current_persent
    (@test_passage.count_question.to_f - 1) / @test_passage.count_all_questions*100
  end

  def progressbar
      content_tag :div, nil,
        class: 'progress-bar',
        role: 'progressbar',
        style: "width: #{current_persent}%",
        aria_valuenow: current_persent,
        aria_valuemin: 0,
        aria_valuemax: 100
  end

end
