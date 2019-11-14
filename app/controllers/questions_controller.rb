class QuestionsController < ApplicationController

  before_action :test_find, only: %i[index create]
  before_action :question_find, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
#    result = ["Class: #{params.class}", "Parameters:#{params.inspect} "]
#    render plain: result.join("\n")
    render plain: @test.questions.to_ary
  end

  def show
#    @question = Question.find(params[:id])
    render html: @question.body
  end

  def new

  end

  def create
#    @test = Test.find(params[:test_id])
    @question = @test.questions.new(parameters_questions)
    if @question.save
      redirect_to test_questions_path
    else
      render :new
    end
  end

  def destroy
#    @question = Question.find(params[:id])
    @question.delete
  end

  private

  def test_find
    @test = Test.find(params[:test_id])
  end

  def question_find
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

  def parameters_questions
    params.require(:question).permit(:body)
  end

end
