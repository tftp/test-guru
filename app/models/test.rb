class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_and_belongs_to_many :users

  def self.list_tests_for_category(name)
    Test.joins('JOIN categories ON tests.category_id == categories.id').where(categories.title: name).order('title DESC').pluck(:title)
  end

end
