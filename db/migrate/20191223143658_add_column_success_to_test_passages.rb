class AddColumnSuccessToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column(:test_passages, :success, :boolean, default: false, null: false)
  end
end
