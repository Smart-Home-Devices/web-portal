class SensorsController < ApplicationController
before_action :check_user

def index
	@sensors = current_user.family.sensors.order('id asc').all
end

def check_user
	unless user_signed_in?
		redirect_to url_for(action: 'welcome', controller: 'pages')
	end
end

end
