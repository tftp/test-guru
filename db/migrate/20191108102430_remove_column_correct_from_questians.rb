class RemoveColumnCorrectFromQuestians < ActiveRecord::Migration[6.0]
  def change
    remove_column(:questions, :correct)
  end
end
