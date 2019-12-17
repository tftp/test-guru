class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title, default: 'Undefine'
      t.string :filename
      t.string :rule, default: 'Undefine'

      t.timestamps
    end
  end
end
