class GroupsController < ApplicationController
before_action :authenticate_user!, :except => [:index, :show]

  # GET /groups
  # GET /groups.json
  def index
    @city = City.find(city_group_path)
    @groups = @city.groups
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
    @user = current_user
  end

  # GET /groups/new
  def new
    @city = City.find(params[:city_id])
    @group = @city.groups.new
  end

  # GET /groups/1/edit
  def edit
    @city = City.find(params[:city_id])
    @group = @city.groups.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @city = City.find(params[:city_id])
    @group = @city.groups.new(params[:group])
    @group.user = current_user

    respond_to do |format|
      if @group.save
        gflash :success => "Group page was successfully created."
        format.html { redirect_to [@city, @group] }
        format.json { render action: 'show', status: :created, location: @group }
      else
        format.html { render action: 'new' }
        format.json { render json: city_group_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    @city = City.find(params[:city_id])
    @group = @city.groups.find(params[:id])
    
    respond_to do |format|
        if @group.update_attributes(params[:group])
        gflash :notice => "Your group was successfully updated."
        format.html { redirect_to [@city, @group] }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: (@group).errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @city = City.find(params[:city_id])
    @group = @city.groups.find(params[:id])
    @group.destroy
    respond_to do |format|
      gflash :notice => "Your group was successfully deleted."
      format.html { redirect_to root_url}
      format.json { head :no_content }
    end
  end
  
   def join
         @group = Group.find(params[:id])
         @membership = @group.memberships.build(:user_id => current_user.id)

         respond_to do |format|
           if @membership.save
             gflash :success => "You have joined this group!"
             format.html { redirect_to(city_group_path) }
             format.xml  { head :ok }
           else
             format.html { redirect_to(city_group_path, :notice => 'You have already joined a networking group.') }
             format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
           end
         end
       end

     def unjoin 
       @group = Group.find(params[:id])
       @membership = @group.memberships.find_by_user_id(current_user.id)
       @membership.destroy rescue nil
       gflash :success => "You have left this group!"
       redirect_to(city_group_path)
     end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params[:group]
    end
    
  
       
end
