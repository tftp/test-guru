module TestsHelper

  def timeset_for_test(test)
    test.timeset == 0 ? '-' : @test.timeset
  end
end
