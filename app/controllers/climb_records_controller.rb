class ClimbRecordsController < ApplicationController
  before_action :set_climb_record, only: [:show, :edit, :update, :destroy]

  # GET /climb_records
  # GET /climb_records.json
  def index
    @climb_records = ClimbRecord.all
  end

  # GET /climb_records/1
  # GET /climb_records/1.json
  def show
  end

  # GET /climb_records/new
  def new
    @climb_record = ClimbRecord.new
  end

  # GET /climb_records/1/edit
  def edit
  end

  # POST /climb_records
  # POST /climb_records.json
  def create
    @climb_record = ClimbRecord.new(climb_record_params)

    respond_to do |format|
      if @climb_record.save
        format.html { redirect_to @climb_record, notice: 'Climb record was successfully created.' }
        format.json { render :show, status: :created, location: @climb_record }
      else
        format.html { render :new }
        format.json { render json: @climb_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /climb_records/1
  # PATCH/PUT /climb_records/1.json
  def update
    respond_to do |format|
      if @climb_record.update(climb_record_params)
        format.html { redirect_to @climb_record, notice: 'Climb record was successfully updated.' }
        format.json { render :show, status: :ok, location: @climb_record }
      else
        format.html { render :edit }
        format.json { render json: @climb_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /climb_records/1
  # DELETE /climb_records/1.json
  def destroy
    @climb_record.destroy
    respond_to do |format|
      format.html { redirect_to climb_records_url, notice: 'Climb record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_climb_record
      @climb_record = ClimbRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def climb_record_params
      params.require(:climb_record).permit(:elevation_gain, :activity_id, :start_time, :end_time, :total_time, :User_id)
    end
end
