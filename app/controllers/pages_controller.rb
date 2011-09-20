class PagesController < ApplicationController
  	
  def home
    @title = "Home"
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end



  def submit
	@title = "Submit"

  end

  def settings
	@title = "Settings"

  end

  def about
	@title = "About"

  end

  def Add_problem
    @title = "Add Problem"
  end
end
