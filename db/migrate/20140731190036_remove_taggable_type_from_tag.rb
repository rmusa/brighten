class RemoveTaggableTypeFromTag < ActiveRecord::Migration
  def change
    remove_column :tags, :taggable_type, :string
  end
end
