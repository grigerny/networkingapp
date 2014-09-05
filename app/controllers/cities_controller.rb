class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @cities = City.all
  end

  def show
    @user = current_user
  end

  # GET /groups/new
  def new
    @city = City.new
  end

  def edit
  end

  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'Group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @city }
      else
        format.html { render action: 'new' }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to @city, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_url }
      format.json { head :no_content }
    end
  end
  
  def join
      @city = City.find(params[:id])
      @membership = @city.memberships.build(:user_id => current_user.id)

      respond_to do |format|
        if @membership.save
          format.html { redirect_to(@city, :notice => 'You have joined a networking group.') }
          format.xml  { head :ok }
        else
          format.html { redirect_to(@city, :notice => 'You have already joined a networking group') }
          format.xml  { render :xml => @city.errors, :status => :unprocessable_entity }
        end
      end
    end

  def unjoin 
    @city = City.find(params[:id])
    @membership = @city.memberships.find_by_user_id(current_user.id)
    @membership.destroy rescue nil
    redirect_to(@city, :notice => 'You have left this networking group.')
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params[:city]
    end
    
    
end
