class AddPictureColumnsToOrganizations < ActiveRecord::Migration
  def change
  	add_attachment :organizations, :picture
  end
end
