class AddSlugToProfessor < ActiveRecord::Migration
  def change
  	add_column :professors, :slug, :string, unique: true
  end
end
