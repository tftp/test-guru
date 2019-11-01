class CreateUsersTestsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users_tests, id: false do |t|
      t.integer :tests_id
      t.integer :users_id
    end

    add_index :users_tests, :users_id
    add_index :users_tests, :tests_id

  end
end
