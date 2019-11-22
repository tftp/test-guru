require 'digest/sha1'

class User < ApplicationRecord

#  include Auth

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :my_tests, class_name: "Test", foreign_key: "author_id"

  has_secure_password

  def list_test(level)
    self.tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  validates :email, uniqueness: true
  validates :email, format: { with: /\A\w+@\w+\.[a-z]{2,3}\z/}

end
