class DevicesController < ApplicationController
before_action :set_device, only: [:state_change, :show, :destroy]
before_action :check_user

	def index
		@devices = current_user.devices.order("id asc").all
	end

	def state_change
		# raise @device.inspect
		if @device.state
			@device.update(state: 0)
		else
			@device.update(state: 1)
		end
		redirect_to devices_path
	end

	def new
		@device = current_user.devices.new
	end

	def set_device
		@device = current_user.devices.find(params[:id])
	end

	def show
	end

	def create
		@device = current_user.devices.new(device_params)
		respond_to do |format|
			if @device.save
				format.html { redirect_to @device, notice: 'Device was successfully added.' }
        		format.json { render :show, status: :created, location: @device }
			else
        		format.html { render :new }
       		    format.json { render json: @device.errors, status: :unprocessable_entity }
      		end
      	end
    end

    def destroy
    	@device.destroy
    	respond_to do |format|
          format.html { redirect_to devices_path, notice: 'Device was successfully removed.' }
    	  format.json { head :no_content }
  	 	end
    end

	def device_params
      params.require(:device).permit(:name, :state, :rpi_id)
    end

    def check_user
    	unless user_signed_in?
    		redirect_to url_for(action: 'welcome', controller: 'pages')
    	end
    end
end
