class AfterSignupController < ApplicationController
  include Wicked::Wizard
  steps :confirm_profile
  
  def show
    @user = current_user
    render_wizard
  end
  
  def update
    @user = current_user
    @user.attributes = params[:user]
    render_wizard @user
  end
end
