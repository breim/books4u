class AddImageToProfessors < ActiveRecord::Migration
  def change
  	add_column :professors, :image_file_name, :string   
  	add_column :professors, :image_content_type, :string
  	add_column :professors, :image_file_size, :integer
  end
end
