class AfterSignupController < ApplicationController
  include Wicked::Wizard
  steps :confirm_profile
  
  def show
    @user = current_user
    render_wizard
  end
  
  def update
      @user = User.find(params[:user_id])
      params[:user][:status] = step.to_s
      params[:user][:status] = 'active' if step == steps.last
      @user.update_attributes(params[:user])
      render_wizard @user
  end

   
   
end
