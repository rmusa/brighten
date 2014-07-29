class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :organization_picture
      t.string :phone
      t.string :email
      t.text :description
      t.string :website
      t.string :address
    end
  end
end
