class CreateResultTable < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.integer :value_all
      t.integer :value_current
      t.references :tests, foreign_key: true
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
