# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create, ]
  before_action :configure_account_update_params, only: [:update]
  before_action :configure_admin_account_update_params, only: [:update_admin]
  before_action :configure_master_account_update_params, only: [:create_user_master]
  # after_action only: [:create] do
  #   if signed_in?
  #     UserMailer.new_signup(params[:user][:first_name], params[:user][:email]).deliver_now
  #   end
  # end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  def delete_user
    User.destroy(params[:format])
    redirect_to users_path
  end

  def edit_admin
    @user = User.find(params[:id])
  end

  def create_user
    @user = User.new
  end

  def create_user_master
    @user = User.new(configure_master_account_update_params)
    @user.save
    redirect_to users_path
  end

  # PUT /resource
  # def update
  #   super
  # end

  def update_admin
    @user = User.find_by(id: params[:user][:id])
    @user.update(configure_admin_account_update_params)

    redirect_to root_path
    
  end

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

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  def configure_admin_account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :user_type)
  end

  def configure_master_account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :user_type, :password, :password_confirmation)
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
