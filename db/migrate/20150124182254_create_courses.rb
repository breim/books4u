class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.float :nota_pi
      t.float :nota_pf
      t.boolean :done
      t.belongs_to :professor, index: true

      t.timestamps null: false
    end
    add_foreign_key :courses, :professors
  end
end
