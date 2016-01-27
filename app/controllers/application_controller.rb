class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_variables
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:account_update) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name
    devise_parameter_sanitizer.for(:account_update) << :last_name
  end

  def set_variables
    if user_signed_in?
      gon.logged_in=1
      devices = current_user.family.devices.order("id asc").all
      if !devices.nil? && !current_user.admin?
        array = Array.new
        for device in devices
          device.user_id = device.user_id.split(',')
          if device.user_id.include?(current_user.id.to_s)
            array.push device
          end
        end
        devices = array.sort_by {|a| a.id}
      end
      sensors = current_user.family.sensors.all
      for sensor in sensors
        if sensor.name=="LPG Gas Sensor" && sensor.value==1
          flash[:error]="LPG leak detected "+Time.now.in_time_zone("Chennai").strftime("at %I:%M%p")+"!"
        elsif sensor.name =="CO2 Gas Sensor" && sensor.value==1
          flash[:alert]="Something was burning at "+Time.now.in_time_zone("Chennai").strftime("at %I:%M%p")+"!"
        elsif sensor.name=="LPG Gas Sensor" && sensor.value==0
          flash.discard(:error)
        elsif sensor.name =="CO2 Gas Sensor" && sensor.value==0
          flash.discard(:alert)
        end
      end
      gon.watch.devices = devices
      gon.watch.sensors = sensors
    else
      gon.logged_in=0
    end
  end
end
