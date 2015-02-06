class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :name
      t.integer :search_id
      t.string :search_model

      t.timestamps null: false
    end
  end
end
