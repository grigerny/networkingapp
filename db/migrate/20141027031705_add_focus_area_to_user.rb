class AddFocusAreaToUser < ActiveRecord::Migration
  def change
    add_column :users, :focus_area, :string
  end
end
