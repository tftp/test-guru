class AddForeignKeyOnAuthor < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :tests, :users, column: :author, primary_key: "id"
  end
end
