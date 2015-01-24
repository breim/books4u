class Course < ActiveRecord::Base
	# Validations
	validates :name,presence: true
	validates :nota_pf,presence: true, :inclusion => 0..10
	validates :nota_pi, presence: true, :inclusion => 0..10

	# Relations
	belongs_to :professor
end
