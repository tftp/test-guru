class AddColumnTimedownToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column(:test_passages, :timedown, :integer, default: 0, null: false)
  end
end
