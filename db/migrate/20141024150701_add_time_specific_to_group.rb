class AddTimeSpecificToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :time_specific, :string
    add_column :groups, :rules, :string
  end
end
