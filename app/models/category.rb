class Category < ApplicationRecord
  has_many :tests, inverse_of: :category

  default_scope {order(title: :asc)}

  validates :title, presence: true

end
