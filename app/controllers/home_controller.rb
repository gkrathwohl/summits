class HomeController < ApplicationController

  def index
    authenticate()
    if (@current_user)
      redirect_to @current_user
    else
      render "connect_to_strava", :layout => false
    end
  end

  def mobile_redirect
    return redirect_to "com.gkrathwohl.RunLog:/oauth2Callback/" + request.env["QUERY_STRING"]
  end


end