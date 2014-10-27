class MembershipsController < ApplicationController
  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
end
