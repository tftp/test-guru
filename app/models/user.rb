class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable,
          :trackable,
          :confirmable


  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :my_tests, class_name: "Test", foreign_key: "author_id"
  has_many :gists
  has_and_belongs_to_many :badges


  def list_test(level)
    self.tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def is_admin?
    self.type == 'Admin'
  end

  validates :email, uniqueness: true
  validates :email, format: { with: /\A\w+@\w+\.[a-z]{2,3}\z/}

  def list_of_rule
    self.methods.select {|m| m=~/\Arule/}
  end

  def rule_for_all_tests_success

  end

  def rule_for_test_success

  end

  def rule_for_tests_success_of_category

  end

  def rule_for_tests_success_of_level

  end


end
