class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.boolean :starred
      t.integer :user_id
      t.integer :link_id

      t.timestamps
    end
  end
end
