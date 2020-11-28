# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  protected

  # パスワードなしのアップデートメソッド
  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :avatar, :avatar_cache, :remove_avatar])
   end
  
end
