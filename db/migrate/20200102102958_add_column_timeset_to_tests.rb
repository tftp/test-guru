class AddColumnTimesetToTests < ActiveRecord::Migration[6.0]
  def change
    add_column(:tests, :timeset, :integer, default: 10, null: false)
  end
end
