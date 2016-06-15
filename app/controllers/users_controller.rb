require 'uri'
require 'net/http'
require 'strava/api/v3'
require './app/jobs/find_peaks_job'
require './app/helpers/strava_helper.rb'

class UsersController < ApplicationController
  #before_action :authenticate_user!

  def connect

    unless @user == current_user
      redirect_to :root
    end

    client_id = "3764"
    client_secret = "e0b897e6bc461b774c73fbff6936f656d2e376f3"
    code = params[:code]

    post_params = {'client_id' => client_id, 'client_secret' => client_secret, 'code' => code}
    response = Net::HTTP.post_form(URI.parse('https://www.strava.com/oauth/token'), post_params)

    strava_response = JSON.parse response.body
    
    current_user.token = strava_response['access_token']
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
   
   @summits = @user.summit_completions
   #@activities = StravaHelper.all_activities(@user.token)
   @indexed_activities = IndexedActivity.where(user_id: @user.id)
    
    # @client = Strava::Api::V3::Client.new(:access_token => @user.token)
    # @activities = @client.list_athlete_activities({'per_page' => 200})

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
