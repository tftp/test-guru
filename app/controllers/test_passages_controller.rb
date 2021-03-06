class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show
    unless @test_passage.current_question
      redirect_to root_path, { alert: t('.failure')}
    end
  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.is_timeout? || @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      if @test_passage.success?
        @test_passage.update(success: true)
        BadgeService.new(@test_passage).call
      end
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if result
      @test_passage.current_question.gists.create( user:current_user, url: result.html_url )
      { notice: result.html_url}
    else
      { alert: t('.failure')}
    end
    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
