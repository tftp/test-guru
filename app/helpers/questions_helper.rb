module QuestionsHelper

  def question_header(id)
    test = Test.find(id)
    test.title
  end

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    url = ['https://github.com'] << author << repo
    url.join('/')
  end
end
