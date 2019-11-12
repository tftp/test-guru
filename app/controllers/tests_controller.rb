class TestsController < ApplicationController



  def index
    result = ["Class: #{params.class}", "Parameters:#{params.inspect} "]
    render plain: result.join("\n")
  end

  def show
    result = ["Class: #{params.class}", "Parameters:#{params.inspect} "]
    render plain: result.join("\n")
  end

  def new

  end

end
