class RemoveTaggableIdFromTag < ActiveRecord::Migration
  def change
    remove_column :tags, :taggable_id, :integer
  end
end
