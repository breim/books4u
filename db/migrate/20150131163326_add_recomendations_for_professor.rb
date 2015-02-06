class AddRecomendationsForProfessor < ActiveRecord::Migration
  def change
  	add_column :professors,:recommended_count,:integer, default: 0
  	add_column :professors,:unrecommended_count,:integer,default: 0
  end
end
