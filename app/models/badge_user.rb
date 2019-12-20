class BadgeUser < ApplicationRecord

  belongs_to :user
  belongs_to :badge

  scope :seconds_ago, -> {where(created_at: 5.seconds.ago..Time.current)}

end
