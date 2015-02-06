class Admin::AdminController < ApplicationController
	before_action :authenticate_user!
	before_action :verify_user

  def index
    @users_count = User.all.count
    @professors_count = Professor.all.count
  end
  	
private
  	def verify_user
    	unless current_user.admin
      		redirect_to professors_path , :notice => 'Área Restrita.'
    	end
	  end

end