class Admin::QuestionsController < Admin::BaseController

  before_action :test_find, only: %i[index create]
  before_action :question_find, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show

  end

  def new
    @question = Question.new
  end

  def edit

  end

  def update
    if @question.update(parameters_questions)
      redirect_to admin_test_questions_path(@question[:test_id])
    else
      render :edit
    end

  end

  def create
    @question = @test.questions.new(parameters_questions)
    if @question.save
      redirect_to admin_test_questions_path
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_questions_path(@question[:test_id])
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
