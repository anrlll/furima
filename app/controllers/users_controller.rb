# class UsersController < ApplicationController
#   before_action :configure_permitted_parameters, if: :devise_controller?
#   def index
#   end

#   private

#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :password, :date_birth, :last_name, :first_name, :last_name_kana, :first_name_kana])
#   end
# end
