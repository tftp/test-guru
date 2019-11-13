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
    @test = Test.find(params[:test_id])
    @question = @test.questions.new(parameters_questions)
    @question.save
    redirect_to test_questions_path
  end

  def destroy
    @question = Question.find(params[:id])
    @question.delete
  end

  private

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

  def parameters_questions
    params.require(:question).permit(:body, :test_id)
  end

end
