class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author_id, class_name: "User" , foreign_key: "id"
  has_many :questions
  has_and_belongs_to_many :users

  def self.list_tests_for_category(name)
    Category.joins(:tests).where(title: name).order('tests.title DESC').pluck('tests.title')
  end

end
