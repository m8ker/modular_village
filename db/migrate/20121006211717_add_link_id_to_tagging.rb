class AddLinkIdToTagging < ActiveRecord::Migration
  def change
    add_column :taggings, :link_id, :integer
  end
end
