# db/migrate/xxxxxxxxxx_fix_column_name.rb
class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :comments, :comment, :message
  end

  def self.down
    rename_column :comments, :message, :comment
  end
end