class Badge < ApplicationRecord

  belongs_to :picture
  belongs_to :rule
  has_many :badge_users, dependent: :destroy
  has_many :users, through: :badge_users

  def self.scan (current_user, test_passage)
    Badge.find_each(batch_size: 1) do |badge|
      get_badge = current_user.send(badge.rule.command.to_sym, test_passage, badge)
    end
  end

end
