class CreateBadgesUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :badges_users, id: false do |t|
      t.integer :badge_id
      t.integer :user_id
    end

    add_index :badges_users, :badge_id
    add_index :badges_users, :user_id

  end
end
