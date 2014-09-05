class RenameGroupPagesToGroups < ActiveRecord::Migration
   def self.up
     rename_table :group_pages, :groups
   end
  def self.down
     rename_table :groups, :group_pages
  end
end
