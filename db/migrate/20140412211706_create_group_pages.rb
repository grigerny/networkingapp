class CreateGroupPages < ActiveRecord::Migration
  def change
    create_table :group_pages do |t|

      t.timestamps
    end
  end
end
