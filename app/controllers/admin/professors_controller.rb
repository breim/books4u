class Admin::ProfessorsController < Admin::AdminController
	before_action :set_professor, only: [:edit, :update, :destroy]
	respond_to :html

	def index
		@professors = Professor.all.order("created_at desc")
		respond_with(@professors)
	end
	
	private

	def set_professor
		@professor = Professor.find(params[:id])
	end
	
	def professor_params
		params.require(:professor).permit(:name,:user_id, :email, :price, :nota_pi, :nota_pf, :cr, :ranking, :horario, :image, :major, :semester,:description, courses_attributes: [:id, :name,:nota_pf,:nota_pi, :done, :_destroy])
	end
end