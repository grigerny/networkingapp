class AddGroupIdToGroupPages < ActiveRecord::Migration
  def change
    add_column :group_pages, :group_id, :integer
  end
end
