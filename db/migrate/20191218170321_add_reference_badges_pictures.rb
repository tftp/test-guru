class AddReferenceBadgesPictures < ActiveRecord::Migration[6.0]
  def change
    add_reference(:badges, :picture, foreign_key: true)
  end
end
