class AddMessageAndLinkIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :message, :text
    add_column :comments, :link_id, :integer
  end
end
