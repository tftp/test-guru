class QuestionsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
#    result = ["Class: #{params.class}", "Parameters:#{params.inspect} "]
#    render plain: result.join("\n")
    @test = Test.find(params[:test_id])
    render plain: @test.questions.to_ary

  end

  def show
    @question = Question.find(params[:id])
    render html: @question.body

  end

  def new

  end

  def create
    render plain: 'saved!'
  end

  private

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

end
