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


  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :my_tests, class_name: "Test", foreign_key: "author_id"
  has_many :gists, dependent: :destroy
  has_many :badge_users, dependent: :destroy
  has_many :badges, through: :badge_users, dependent: :destroy


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

  def rule_for_test_success(test_passage, badge)
    if badge.option.empty?
      if self.tests.where(id: test_passage.test_id).count == 1
        self.badges.push badge
        return badge
      end
    else
      if self.tests.where(title: badge.option, id: test_passage.test_id).count == 1
        self.badges.push badge
        return badge
      end
    end
  end

  def rule_for_tests_success_of_category(test_passage, badge)
    category = test_passage.test.category.title
    return unless category == badge.option
    Test.tests_for_category(category).each do |test|
      return unless TestPassage.has_success?(self, test)
    end
    self.badges.push badge
  end

  def rule_for_tests_success_of_level(test_passage, badge)
    level = test_passage.test.level.to_s
    return unless level == badge.option
    Test.level(level.to_i).each do |test|
      return unless TestPassage.has_success?(self, test)
    end
    self.badges.push badge
  end


end
