class QuestionsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: {questions: Question.where(test_id: params[:test_id].to_i)}
  end

  def show
    @test = Test.find(params[:test_id])
    render html: @test

  end


  privat

  def rescue_with_question_not_found
    render plain: 'Question not found!'
  end
end
