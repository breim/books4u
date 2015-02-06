class Admin::UsersController < Admin::AdminController
	respond_to :html

	def index
		@users = User.all.order("created_at desc")
		respond_with(@users)
	end

end