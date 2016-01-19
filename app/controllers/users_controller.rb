class UsersController < ApplicationController

def show
	@user = User.find(params[:id])
	@family = current_user.family
	@users = @family.users.all
	@devices = @user.devices.all
end

def permission
	@user = User.find(params[:id])
	@device = Device.find(params[:device])
	array = @device.user_id.split(',')
	unless array.include?(@user.id.to_s)
		array.push @user.id
		
		array.compact!
	    array=array.join(',')
	    @device.update(user_id: array)
	    respond_to do |format|
	    	format.html{redirect_to @user, notice: "Permissions updated!"}
	    end
	else
		respond_to do |format|
	    	format.html{redirect_to @user, notice: "User already has permission."}
	    end
	end

end

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