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


  validates :email, uniqueness: true
  validates :email, format: { with: /\A\w+@\w+\.[a-z]{2,3}\z/}

  def list_test(level)
    self.tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def is_admin?
    self.type == 'Admin'
  end

end
