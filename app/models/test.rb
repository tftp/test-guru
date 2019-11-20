class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: "User" , foreign_key: "author_id"
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  scope :low_lewel, -> {where(level: 0..1)}
  scope :middle_lewel, -> {where(level: 2..4)}
  scope :high_lewel, -> {where(level: 5..Float::INFINITY)}
  scope :tests_for_category, -> (name){joins(:category).where(categories: {title: name})}
  scope :level, -> (level){where(level: level)}

  def self.list_tests_for_category(name)
    tests_for_category(name).order('tests.title DESC').pluck('tests.title')
  end

  validates :level, numericality: {only_integer: true, greater_than: -1}
  validates :title, uniqueness: {scope: :level}
  validates :title, presence: true

end
