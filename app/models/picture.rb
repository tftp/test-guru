class Picture < ApplicationRecord

  has_many :badges, dependent: :destroy

end
