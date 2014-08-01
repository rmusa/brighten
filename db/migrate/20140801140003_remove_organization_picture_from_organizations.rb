class RemoveOrganizationPictureFromOrganizations < ActiveRecord::Migration
  def change
  	remove_column :organizations, :organization_picture
  end
end
