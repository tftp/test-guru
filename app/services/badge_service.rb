class BadgeService

  def initialize (test_passage)
    @test_passage = test_passage
    @current_user =  @test_passage.user
  end

  def call
    Badge.find_each do |badge|
      @current_user.send(badge.rule.command.to_sym, @test_passage, badge)
    end
  end

end
