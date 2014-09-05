class GroupsController < ApplicationController

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
    @user = current_user
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new

    respond_to do |format|
      if @group.save
        format.html { redirect_to city_group_path, notice: 'Group page was successfully created.' }
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
    respond_to do |format|
      if @group = Group.find(params[:id])
         @group.update_attributes(params[:group])
         @city = City.find(params[:id])
        format.html { redirect_to (@group), notice: 'Group page was successfully updated.' }
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
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end
  
   def join
         @group = Group.find(params[:id])
         @membership = @group.memberships.build(:user_id => current_user.id)

         respond_to do |format|
           if @membership.save
             format.html { redirect_to(city_group_path, :notice => 'You have joined a networking group.') }
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
       redirect_to(city_group_path, :notice => 'You have left this networking group.')
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
