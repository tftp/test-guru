class AddForeignKeyForAuthorTests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key(:tests, :users, column: :author_id)
  end
end
