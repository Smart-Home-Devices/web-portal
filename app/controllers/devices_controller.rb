class DevicesController < ApplicationController
before_action :set_device, only: [:state_change, :show]

	def index
		@devices = Device.order("id asc").all
	end

	def state_change
		# raise @device.inspect
		if @device.state
			@device.update(state: 0)
		else
			@device.update(state: 1)
		end
		redirect_to root_url
	end

	def set_device
		@device = Device.find(params[:id])
	end

	def show
	end
end
