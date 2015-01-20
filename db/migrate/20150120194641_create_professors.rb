class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.references :user, index: true
      t.string :email
      t.string :price
      t.decimal :nota_pi
      t.decimal :nota_pf
      t.decimal :cr
      t.integer :ranking
      t.text :horario

      t.timestamps null: false
    end
    add_foreign_key :professors, :users
  end
end
