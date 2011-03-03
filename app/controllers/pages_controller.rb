class PagesController < ApplicationController
  def home
      @title = "Home"
      @feed_items = Event.all.paginate(:page => params[:page])
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

end
