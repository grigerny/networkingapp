class RenameGroupsToCities < ActiveRecord::Migration
  def self.up
         rename_table :groups, :cities
       end
      def self.down
         rename_table :cities, :groups
      end
end
