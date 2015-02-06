class AddDescriptionToProfessors < ActiveRecord::Migration
  def change
  	add_column :professors, :description, :text
  end
end
