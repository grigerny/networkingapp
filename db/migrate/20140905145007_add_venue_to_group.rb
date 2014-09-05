class AddVenueToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :venue, :string
  end
end
