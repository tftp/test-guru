class TestsController < ApplicationController

  before_action :authenticate_user!
#  before_action :after_sign_in_path_for, only: %i[index]
  before_action :set_test, only: %i[start]

  def index
    @test = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end


  private

  def after_sign_in_path_for
    if current_user.is_admin?
      redirect_to admin_tests_path
    end
  end


  def set_test
    @test = Test.find(params[:id])
  end

end
