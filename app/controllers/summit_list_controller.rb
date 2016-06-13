class SummitListController < ApplicationController
    
  def index
    @summit_lists = SummitList.all
  end

end
