class Badge < ApplicationRecord

  belongs_to :picture
  has_and_belongs_to_many :users

  scope :rule_not_nil, -> {where(rule: !'Undefine')}
  scope :rule_is_nil, -> {where(rule: 'Undefine')}

end
