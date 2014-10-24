class CitiesController < ApplicationController
before_action :authenticate_user!, :except => [:index, :show]

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @groups_grid = initialize_grid(Group)
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
  
    
end
