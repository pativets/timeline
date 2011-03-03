module ApplicationHelper

	def title
		base_title = "TimeLine - Free and Cheap Events"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end			
	
	def logo
		image_tag("logo.png", :height => 70, :width => 250, :alt => "TimeLine Logo", :class => "round")
	end
end
