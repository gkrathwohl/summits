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
    return redirect_to "RunLog://gkrathwohl.github.io/?" + request.env["QUERY_STRING"]
  end


end
