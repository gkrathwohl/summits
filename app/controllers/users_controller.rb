require 'uri'
require 'net/http'
require 'strava/api/v3'
require './app/jobs/find_peaks_job'
require './app/helpers/strava_helper.rb'

class UsersController < ApplicationController
  #before_action :authenticate_user!

  def connect

    logger.debug "connecting"

    client_id = "3764"
    client_secret = "e0b897e6bc461b774c73fbff6936f656d2e376f3"
    code = params[:code]

    post_params = {'client_id' => client_id, 'client_secret' => client_secret, 'code' => code}
    response = Net::HTTP.post_form(URI.parse('https://www.strava.com/oauth/token'), post_params)

    strava_response = JSON.parse response.body
    
    current_user.token = strava_response['access_token']

    if current_user.token == nil
      raise "TOKEN ERROR: " + strava_response
    end

    @result = current_user.save
    
    FindPeaksJob.perform_later current_user.id

    redirect_to :root
    
  end

  def index
    @users = User.all.sort_by(&:unique_summits_count).reverse
  end

  def home
    if (current_user)
      redirect_to current_user
    else
      redirect_to new_user_session_path
    end
  end

  def profile

    if(User.exists?(params[:id]))
      @user = User.find(params[:id])
    else
      return redirect_to :root
    end

    client = Strava::Api::V3::Client.new(:access_token => @user.token)
    athlete = client.retrieve_another_athlete(3825076)

    @profile_url = athlete['profile']

  end


  def show
    if(params[:id])
      @user = User.find(params[:id])
    elsif(current_user)
      @user = User.find(current_user.id)
    else
      return redirect_to :root
    end

    FindPeaksJob.perform_later @user.id    

    if @user.token.nil?
      return #redirect_to action: "connect", :alert => "Please Connect to Strava."
    end
   
    if params[:sorted] == "elevation"
      @sort_string = "osm_summit_elevation DESC"
      @sort_by = "elevation"
    elsif params[:sorted] == "name"
      @sort_string = "summit ASC"
      @sort_by = "name"
    else
      @sort_string = "date DESC"
      @sort_by = "date"
    end

    @summits = @user.summit_completions.order(@sorted_by)
    @indexed_activities = IndexedActivity.where(user_id: @user.id)
  end

  def map
    if(params[:id])
      @user = User.find(params[:id])
    elsif(current_user)
      @user = User.find(current_user.id)
    else
      return redirect_to :root
    end

    if @user.token.nil?
      return #redirect_to action: "connect", :alert => "Please Connect to Strava."
    end

    if(params[:peak])
      summit_completion = SummitCompletion.find(params[:peak])
      @start_location = [summit_completion.osm_summit_lat, summit_completion.osm_summit_lon]
    end

   @summits = @user.summit_completions
   #@activities = StravaHelper.all_activities(@user.token)
   @indexed_activities = IndexedActivity.where(user_id: @user.id)
    
    # @client = Strava::Api::V3::Client.new(:access_token => @user.token)
    # @activities = @client.list_athlete_activities({'per_page' => 200})
    
  end

  def get_summits
    @user = User.find(params[:id])
    render json: @user.summit_completions
  end

  def map_activities
    @user = User.find(params[:id])
    #render json: @activities = StravaHelper.all_activities(@user.token)
  end

  def get_activity
    @activity = StravaHelper.get_activity("cef80412c4e6894a8caa3f847e5fc48168baa0dc", params[:id])
    
    #363bb4bcba39157d212a0fed956f126a0da39d81
    @decoded_polyline = StravaHelper.decode_polyline(@activity['map']['summary_polyline'])
    render json: @decoded_polyline
  end

  def get_activities
    @user = User.find(params[:id])
    @activities = StravaHelper.all_activities(@user.token)
    render json: @activities
  end

  def get_status
    @user = User.find(params[:id])
    @activities = StravaHelper.all_activities(@user.token)
    @indexed_activities = IndexedActivity.where(user_id: @user.id)
    @status = {"activity_count" => @activities.count, "indexed_count" => @indexed_activities.count }
    render json: @status
  end


end
