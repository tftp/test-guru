class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :my_tests, class_name: "Test", foreign_key: "author"

  def list_test(level)
    self.tests.where(level: level)
  end

end
