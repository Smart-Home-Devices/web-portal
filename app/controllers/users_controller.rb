class UsersController < ApplicationController

def show
	@user = User.find(params[:id])
	@family = current_user.family
	@users = @family.users.all
	@devices = @user.devices.all
end

# def permissions
# 	@user = User.find(params[:id])
# 	@devices = Device.where(rpi_id: @user.family.rpi_id).order("created_at").all
# end
def change_admin
	@user = User.find(params[:id])
	if @user.admin?
		@user.update(admin: false)
	else
		@user.update(admin: true)
	end
	redirect_to user_path
end

end