class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_and_belongs_to_many :users

  def self.list_tests_for_category(name)
    list = []
    id = Category.find_by(title: name).id
    Test.where(category_id: id).order('title DESC').each do |test|
      list << test.title
    end
    return list
  end

end
