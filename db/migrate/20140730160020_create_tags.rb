class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :taggable_id
      t.string :taggable_type
    end
  end
end
