class Test < ApplicationRecord
  belongs_to :categories
  has_many :questions
  has_and_belongs_to_many :users
end
