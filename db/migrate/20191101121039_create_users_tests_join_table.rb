class CreateUsersTestsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :tests_users, id: false do |t|
      t.references :test, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
