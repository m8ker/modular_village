class AddNameAndDescToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :name, :string
    add_column :categories, :description, :text
  end
end
