class FamiliesController < ApplicationController

def create
	@family = Family.new(family_params)
	respond_to do |format|
			if @family.save
				format.html { redirect_to new_user_registration_path(family_id: @family.id), notice: 'New family created!' }
        		# format.json { render :show, status: :created, location: @device }
			else
        		format.html { render :new }
       		    format.json { render json: @family.errors, status: :unprocessable_entity }
      		end
      	end
end

def new
	@family = Family.new
end

def show
	@family = current_user.family
	@users = @family.users.all
end

def family_params
    params.require(:family).permit(:name, :rpi_id)
end

end
