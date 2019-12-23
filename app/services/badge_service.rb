class BadgeService

  def initialize (test_passage)
    @test_passage = test_passage
    @current_user =  @test_passage.user
  end

  def call
    Badge.find_each do |badge|
      self.send(badge.rule.command.to_sym, badge)
    end
  end

  private

  def rule_for_test_success(badge)
    if badge.option.empty?
      return @current_user.badges.push badge if @current_user.tests.where(id: @test_passage.test_id).count == 1
    end
    if @current_user.tests.where(title: badge.option, id: @test_passage.test_id).count == 1
      @current_user.badges.push badge
    end
  end

  def rule_for_tests_success_of_category(badge)
    category = @test_passage.test.category.title
    return unless category == badge.option
    Test.tests_for_category(category).each do |test|
      return unless TestPassage.has_success?(@current_user, test)
    end
    @current_user.badges.push badge
  end

  def rule_for_tests_success_of_level(badge)
    level = @test_passage.test.level.to_s
    return unless level == badge.option
    Test.level(level.to_i).each do |test|
      return unless TestPassage.has_success?(@current_user, test)
    end
    @current_user.badges.push badge
  end

end
