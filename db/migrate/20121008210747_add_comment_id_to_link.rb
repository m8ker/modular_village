class AddCommentIdToLink < ActiveRecord::Migration
  def change
    add_column :links, :comment_id, :integer
  end
end
