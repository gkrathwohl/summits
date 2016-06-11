require 'uri'
require 'net/http'
require 'strava/api/v3'
require './app/jobs/find_peaks_job'
require './app/helpers/strava_helper.rb'

class UsersController < ApplicationController
  before_action :authenticate_user!

  def connect
    client_id = "3764"
    client_secret = "e0b897e6bc461b774c73fbff6936f656d2e376f3"
    code = params[:code]

    post_params = {'client_id' => client_id, 'client_secret' => client_secret, 'code' => code}
    response = Net::HTTP.post_form(URI.parse('https://www.strava.com/oauth/token'), post_params)

    strava_response = JSON.parse response.body
    
    current_user.token = strava_response['access_token']
    @result = current_user.save
    
    FindPeaksJob.perform_later current_user.id
    
  end

  def index
    @users = User.all
  end

  def home
    redirect_to current_user
  end

  def show

    FindPeaksJob.perform_later current_user.id    

    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end

    if @user.token.nil?
      return #redirect_to action: "connect", :alert => "Please Connect to Strava."
    end
   
   @summits = @user.summit_completions
   @activities = StravaHelper.all_activities(@user.token)
   @indexed_activities = IndexedActivity.where(user_id: @user.id)
    
    # @client = Strava::Api::V3::Client.new(:access_token => @user.token)
    # @activities = @client.list_athlete_activities({'per_page' => 200})
    
    
  end
  


end
