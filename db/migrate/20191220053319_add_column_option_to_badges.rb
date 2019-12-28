class AddColumnOptionToBadges < ActiveRecord::Migration[6.0]
  def change
    add_column(:badges, :option, :string, default: '', null: false)
  end
end
