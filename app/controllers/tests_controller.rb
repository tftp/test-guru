class TestsController < ApplicationController



  def index
    @test = Test.all
  end

  def show
    result = ["Class: #{params.class}", "Parameters:#{params.inspect} "]
    render plain: result.join("\n")
  end

  def new

  end

end
