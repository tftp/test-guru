class AddColumnAuthorToTests < ActiveRecord::Migration[6.0]
  def change
    add_column(:tests, :author, :integer)
  end
end
