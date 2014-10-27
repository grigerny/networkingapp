class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    after_signup_path(:confirm_profile)
  end
  
  
  private

   def sign_up_params
     params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :industry, :company, :focus_area)
   end

   def account_update_params
     params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password,:industry, :company, :focus_area)
   end
end
