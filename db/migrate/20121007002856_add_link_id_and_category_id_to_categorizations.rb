class AddLinkIdAndCategoryIdToCategorizations < ActiveRecord::Migration
  def change
    add_column :categorizations, :link_id, :integer
    add_column :categorizations, :category_id, :integer
  end
end
