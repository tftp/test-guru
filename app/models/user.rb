class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :tests_create, class_name: "Test", foreign_key: "id"

  def list_test(level)
    self.tests.where(level: level)
  end

end
