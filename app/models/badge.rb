class Badge < ApplicationRecord

  belongs_to :picture
  belongs_to :rule
  has_and_belongs_to_many :users

  def self.scan (current_user, test_passage)
    get_badges = []
    Badge.find_each(batch_size: 1) do |badge|
      get_badge = current_user.send(badge.rule.command.to_sym, test_passage, badge)
      get_badges << get_badge unless get_badge.nil?
    end
    return get_badges
  end

end
