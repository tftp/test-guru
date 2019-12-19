class Badge < ApplicationRecord

  belongs_to :picture
  has_and_belongs_to_many :users

  def self.scan (current_user, test_passage)
    Badge.find_each(batch_size: 1) do |badge|
      current_user.send(badge.rule.to_sym, test_passage, badge)
    end
  end

end
