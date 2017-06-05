class CreateUserCategoryRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :user_category_relationships do |t|
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
