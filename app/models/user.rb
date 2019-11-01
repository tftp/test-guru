class User < ApplicationRecord
  has_and_belongs_to_many :tests

  def list_test(level)
    Test.where(id: self.tests.ids).each do |test|
      puts test.title if test.level == level.to_i
    end
  end
  
end
