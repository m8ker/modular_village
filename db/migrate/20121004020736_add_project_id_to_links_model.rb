class AddProjectIdToLinksModel < ActiveRecord::Migration
  def change
    add_column :links, :project_id, :integer
  end
end
