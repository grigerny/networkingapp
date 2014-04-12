class GroupPagesController < ApplicationController
  before_action :set_group_page, only: [:show, :edit, :update, :destroy]

  # GET /group_pages
  # GET /group_pages.json
  def index
    @group_pages = GroupPage.all
  end

  # GET /group_pages/1
  # GET /group_pages/1.json
  def show
  end

  # GET /group_pages/new
  def new
    @group_page = GroupPage.new
  end

  # GET /group_pages/1/edit
  def edit
  end

  # POST /group_pages
  # POST /group_pages.json
  def create
    @group_page = GroupPage.new(group_page_params)

    respond_to do |format|
      if @group_page.save
        format.html { redirect_to @group_page, notice: 'Group page was successfully created.' }
        format.json { render action: 'show', status: :created, location: @group_page }
      else
        format.html { render action: 'new' }
        format.json { render json: @group_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_pages/1
  # PATCH/PUT /group_pages/1.json
  def update
    respond_to do |format|
      if @group_page.update(group_page_params)
        format.html { redirect_to @group_page, notice: 'Group page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @group_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_pages/1
  # DELETE /group_pages/1.json
  def destroy
    @group_page.destroy
    respond_to do |format|
      format.html { redirect_to group_pages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_page
      @group_page = GroupPage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_page_params
      params[:group_page]
    end
end
