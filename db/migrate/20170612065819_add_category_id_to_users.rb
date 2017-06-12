class AddCategoryIdToUsers < ActiveRecord::Migration[5.0]
    def self.up
      add_column(:users, :category_id, :integer)
      add_index(:users, :category_id)
    end

    def self.down
      remove_index(:users, :column => :category_id)
      remove_column(:users, :category_id)
    end
end
