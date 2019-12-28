class BadgesController < ApplicationController

  def index
    @badge = Badge.all
  end

end
