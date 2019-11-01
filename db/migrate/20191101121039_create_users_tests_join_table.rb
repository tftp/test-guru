class CreateUsersTestsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :tests_users, id: false do |t|
      t.integer :test_id
      t.integer :user_id
    end

    add_index :tests_users, :user_id
    add_index :tests_users, :test_id

  end
end
