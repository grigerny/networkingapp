class RenameNameColumnToUsername < ActiveRecord::Migration
  def self.up
      rename_column :groups, :group_id, :city_id
    end

    def self.down
      rename_column :groups, :city_id, :group_id
    end
end
