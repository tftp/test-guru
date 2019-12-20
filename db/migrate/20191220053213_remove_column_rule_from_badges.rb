class RemoveColumnRuleFromBadges < ActiveRecord::Migration[6.0]
  def change
    remove_column(:badges, :rule)
  end
end
