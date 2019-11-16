module QuestionsHelper

  def question_header(question)
    if question.persisted?
      test = Test.find(question.test_id)
      "Edit #{test.title} Question"
    else
      test = Test.find(params[:test_id])
      "Create New #{test.title} Question"
    end
  end

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    url = ['https://github.com'] << author << repo
    link_to 'test-guru', url.join('/'), target: "_blank"
  end
end
