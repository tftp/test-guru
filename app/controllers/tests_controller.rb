class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test, only: %i[show edit update destroy start]
  before_action :set_user, only: %i[start]

  def index
    @test = Test.all
  end

  def show

  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  def new
    @test = Test.new
  end

  def edit

  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = User.first
  end
end
