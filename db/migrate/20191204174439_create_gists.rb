class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.references :question, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.column :url, :string, null: false

      t.timestamps
    end
  end
end
