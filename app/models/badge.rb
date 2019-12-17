class Badge < ApplicationRecord

  scope :rule_not_nil, -> {where(rule: !'Undefine')}
  scope :rule_is_nil, -> {where(rule: 'Undefine')}

end
