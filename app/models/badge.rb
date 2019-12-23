class Badge < ApplicationRecord

  belongs_to :picture
  belongs_to :rule
  has_many :badge_users, dependent: :destroy
  has_many :users, through: :badge_users, dependent: :destroy

  validates :title, presence: true
  validates :picture_id, presence: true
  validates :rule_id, presence: true

end
