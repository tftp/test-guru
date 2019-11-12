class QuestionsController < ApplicationController

#  rescue_from ApplicationController, with: :rescue_with_nothing_error

  def index
#    result = ["Class: #{params.class}", "Parameters:#{params.inspect} "]
#    render plain: result.join("\n")
    render json: {questions: Question.where(test_id: params[:test_id].to_i)}
#    result = Question.where(test_id: params[:test_id].to_i)
#    render plain: result.to_ary
  end

  def show
    test_id = params[:test_id].to_i
    id = params[:id].to_i - 1
    result = Question.where(test_id: test_id)
    render html: result.to_ary[id].body

  end


  privat

  def rescue_with_nothing_error
    render plain: 'Request wrong!'
  end
end
