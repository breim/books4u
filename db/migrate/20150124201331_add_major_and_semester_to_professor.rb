class AddMajorAndSemesterToProfessor < ActiveRecord::Migration
  def change
    add_column :professors, :major, :string
    add_column :professors, :semester, :integer
  end
end
