class CorrectReferenceTestsCategories < ActiveRecord::Migration[6.0]
  def change
    remove_reference(:tests, :categories, foreign_key: false)
  end
end
