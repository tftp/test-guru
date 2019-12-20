module TestPassagesHelper

  def result_in_persent(test_passage)
    test_passage.result_in_persent
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

  def user_badges
    BadgeUser.seconds_ago
  end

end
