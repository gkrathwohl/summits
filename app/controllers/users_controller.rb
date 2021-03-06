require 'uri'
require 'net/http'
require 'strava/api/v3'
require './app/jobs/find_peaks_job'
require './app/helpers/strava_helper.rb'

class UsersController < ApplicationController

  def index_activities
    @user = User.find(params[:id])
    FindPeaksJob.perform_later @user.id
    render json: "indexing"
  end

  def index
    @users = User.all.sort_by(&:unique_summits_count).reverse
  end

  # /users/:id
  def show
    # get user from :id parameter
    if(params[:id] && User.exists?(params[:id]))
      user = User.find(params[:id])
    else
      return redirect_to :root
    end

    @show_user = {}
    @show_user['']

  end


  def show_old

    # get user from :id parameter
    if(params[:id] && User.exists?(params[:id]))
      @user = User.find(params[:id])
    else
      return redirect_to :root
    end

    # use the current_user's token to get the strava client
    #client = Strava::Api::V3::Client.new(:access_token => current_user.token)
    client = Strava::Api::V3::Client.new(:access_token => "cef80412c4e6894a8caa3f847e5fc48168baa0dc")

    if @user.token.nil?
      return #redirect_to action: "connect", :alert => "Please Connect to Strava."
    end

    # retrieve the strava id of the requested profile.
    athlete = client.retrieve_another_athlete(@user.uid)

    @id = params[:id]
    @first_name = athlete['firstname']
    @last_name = athlete['lastname']
    @city = athlete['city']
    @state = athlete['state']
    @profile_url = athlete['profile']
    @unique_summits = @user.unique_summits_count
   
    if params[:sorted] == "elevation"
      @sort_string = "osm_summit_elevation DESC"
      @sort_by = "elevation"
    elsif params[:sorted] == "summit-name"
      @sort_string = "summit ASC"
      @sort_by = "summit-name"
    elsif params[:sorted] == "activity-name"
      @sort_string = "activity_name ASC"
      @sort_by = "activity-name"
    else
      @sort_string = "date DESC"
      @sort_by = "date"
    end

    @summits = @user.summit_completions.order(@sorted_by)
    @indexed_activities = IndexedActivity.where(user_id: @user.id)

    FindPeaksJob.perform_later @user.id

  end

  def vertical
    if(params[:id] && User.exists?(params[:id]))
      @user = User.find(params[:id])
    else
      return redirect_to :root
    end

    # use the current_user's token to get the strava client
    #client = Strava::Api::V3::Client.new(:access_token => current_user.token)
    client = Strava::Api::V3::Client.new(:access_token => "cef80412c4e6894a8caa3f847e5fc48168baa0dc")

    if @user.token.nil?
      return #redirect_to action: "connect", :alert => "Please Connect to Strava."
    end

    # retrieve the strava id of the requested profile.
    athlete = client.retrieve_another_athlete(@user.uid)

    @id = params[:id]
    @first_name = athlete['firstname']
    @last_name = athlete['lastname']
    @city = athlete['city']
    @state = athlete['state']
    @profile_url = athlete['profile']
    @unique_summits = @user.unique_summits_count

    @climbs_152 = @user.climb_records.where(:elevation_gain =>  152.4).order(:total_time).first(3)
    @climbs_304 = @user.climb_records.where(:elevation_gain =>  304.8).order(:total_time).first(3)
    @climbs_1000 = @user.climb_records.where(:elevation_gain =>  1000).order(:total_time).first(3)
  end

  def lists
    if(params[:id] && User.exists?(params[:id]))
      @user = User.find(params[:id])
    else
      return redirect_to :root
    end

    # use Greg's token to get the strava client
    client = Strava::Api::V3::Client.new(:access_token => "cef80412c4e6894a8caa3f847e5fc48168baa0dc")

    # retrieve the strava id of the requested profile.
    athlete = client.retrieve_another_athlete(@user.uid)

    @id = params[:id]
    @first_name = athlete['firstname']
    @last_name = athlete['lastname']
    @city = athlete['city']
    @state = athlete['state']
    @profile_url = athlete['profile']
    @unique_summits = @user.unique_summits_count

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

    @lists = SummitList.all
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

    # use the current_user's token to get the strava client
    client = Strava::Api::V3::Client.new(:access_token => "cef80412c4e6894a8caa3f847e5fc48168baa0dc")

    # retrieve the strava id of the requested profile.
    athlete = client.retrieve_another_athlete(@user.uid)

    @id = params[:id]
    @first_name = athlete['firstname']
    @last_name = athlete['lastname']
    @city = athlete['city']
    @state = athlete['state']
    @profile_url = athlete['profile']
    @unique_summits = @user.unique_summits_count

    if(params[:summit_id])
      summit_completion = SummitCompletion.find(params[:summit_id])
      @start_location = [summit_completion.osm_summit_lat, summit_completion.osm_summit_lon]
    end

    @id = params[:id]
    @summits = @user.summit_completions
    @indexed_activities = IndexedActivity.where(user_id: @user.id)

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
    
    @decoded_polyline = StravaHelper.decode_polyline(@activity['map']['summary_polyline'])
    render json: @decoded_polyline
  end

  def get_activities
    @user = User.find(params[:id])
    @activities = StravaHelper.all_activities(@user.token)
    render json: @activities
  end

  # def get_status
  #   @user = User.find(params[:id])
  #   @activities = StravaHelper.all_activities(@user.token)
  #   @indexed_activities = IndexedActivity.where(user_id: @user.id)
  #   @status = {"activity_count" => @activities.count, "indexed_count" => @indexed_activities.count }
  #   render json: @status
  # end

  # this is the recommended endpoint for polling for new activities,
  # but might only include runs, rides, and swims. (not hikes)
  def activity_count
    user = User.find(params[:id])
    count = StravaHelper.activity_count(user.token, user.strava_id)
    @status = {"activity_count" => count}
    render json: @status
  end

  def get_indexed_activity_count
    user = User.find(params[:id])
    indexed_activities = IndexedActivity.where(user_id: user.id)
    indexed_activities_count = {"indexed_activity_count" => indexed_activities.count }
    render json: indexed_activities_count
  end
end
