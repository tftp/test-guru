class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User" , foreign_key: "author_id"
  has_many :questions
  has_and_belongs_to_many :users

  scope :low_lewel, -> {where(level: 0..1)}
  scope :middle_lewel, -> {where(level: 2..4)}
  scope :high_lewel, -> {where(level: 5..Float::INFINITY)}
  scope :list_tests_for_category, -> (name){Category.joins(:tests).where(title: name).order('tests.title DESC').pluck('tests.title')}
  scope :level, -> (level){where(level: level)}

  validates :level, numericality: {only_integer: true, greater_than: -1}
  validates :title, uniqueness: {scope: :level}
  validates :title, presence: true

end
