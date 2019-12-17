class BadgesController < ApplicationController

  def index
    @badge = Badge.rule_not_nil
  end

end
