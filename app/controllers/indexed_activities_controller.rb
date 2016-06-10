class IndexedActivitiesController < ApplicationController
  before_action :set_indexed_activity, only: [:show, :edit, :update, :destroy]

  # GET /indexed_activities
  # GET /indexed_activities.json
  def index
    @indexed_activities = IndexedActivity.all
  end

  # GET /indexed_activities/1
  # GET /indexed_activities/1.json
  def show
  end

  # GET /indexed_activities/new
  def new
    @indexed_activity = IndexedActivity.new
  end

  # GET /indexed_activities/1/edit
  def edit
  end

  # POST /indexed_activities
  # POST /indexed_activities.json
  def create
    @indexed_activity = IndexedActivity.new(indexed_activity_params)

    respond_to do |format|
      if @indexed_activity.save
        format.html { redirect_to @indexed_activity, notice: 'Indexed activity was successfully created.' }
        format.json { render :show, status: :created, location: @indexed_activity }
      else
        format.html { render :new }
        format.json { render json: @indexed_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /indexed_activities/1
  # PATCH/PUT /indexed_activities/1.json
  def update
    respond_to do |format|
      if @indexed_activity.update(indexed_activity_params)
        format.html { redirect_to @indexed_activity, notice: 'Indexed activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @indexed_activity }
      else
        format.html { render :edit }
        format.json { render json: @indexed_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indexed_activities/1
  # DELETE /indexed_activities/1.json
  def destroy
    @indexed_activity.destroy
    respond_to do |format|
      format.html { redirect_to indexed_activities_url, notice: 'Indexed activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indexed_activity
      @indexed_activity = IndexedActivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def indexed_activity_params
      params.require(:indexed_activity).permit(:userId, :activityId)
    end
end
