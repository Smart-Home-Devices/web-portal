class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]
prepend_before_filter :require_no_authentication, only: [ :cancel]
before_filter :authenticate_user!
before_filter :is_admin?, only: [:new]
  # GET /resource/sign_up
  def new
    if params[:family_id]
      @family_id = params[:family_id]
      @first_user = true
    end
    if @family_id
      @family = Family.find(@family_id)
    end
    @user = User.new
    set_minimum_password_length
  end

  # POST /resource
  def create
    @family_id = params[:user][:family_id]
    @family = Family.find(@family_id)
    p = params[:user][:admin]
    # raise p.inspect
    if p
      @first_user = true
    end
    @user = User.new(first_name: params[:user][:first_name], last_name: params[:user][:last_name],email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation], family_id: params[:user][:family_id], admin: params[:user][:admin])
    if @user.save
      if @user.active_for_authentication?
        unless current_user.present?
          set_flash_message :notice, :signed_up if is_navigational_format?
          sign_up(:user, @user)
        else
          set_flash_message :notice, :user_signed_up
        end
        respond_with @user, :location => after_sign_up_path_for(@user)
      else
        set_flash_message :notice, :"signed_up_but_#{@user.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with @user, :location => after_inactive_sign_up_path_for(@user)
      end
    else
      clean_up_passwords @user
      render :new
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << :last_name
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :family_id
    devise_parameter_sanitizer.for(:sign_up) << :admin
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    if current_user.admin?
      user_path(current_user)
    else
      root_url
    end
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  def is_admin?
  unless params[:family_id]  
    if user_signed_in? # if user signed
    if current_user.admin? # if adminstrator return true
       true
    else
       flash[:error] = "Only admins can create new users!" 
       redirect_to root_url
    end
    else
      flash[:error] = "You need to sign in before continuing." 
      redirect_to new_user_session_path
    end

    end
  else
    true
  end
end
