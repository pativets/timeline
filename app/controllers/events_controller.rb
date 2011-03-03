class EventsController < ApplicationController
	before_filter :authenticate, :only => [:create, :destroy]
	before_filter :authorized_user, :only => :destroy

	def create
		@event = current_user.events.build(params[:event])
		if @event.save
			flash[:success] = "Your even has been created!"
			redirect_to root_path
		else
			@feed_items = []
			render 'events/new'
		end
	end
	
	def new
	  if signed_in?
  		@event = Event.new
  	end
	end
	
	def destroy
		@event.destroy
		redirect_back_or root_path
	end

  private

    def authorized_user
      @event = Event.find(params[:id])
      redirect_to root_path unless current_user?(@event.user)
    end
	

end
