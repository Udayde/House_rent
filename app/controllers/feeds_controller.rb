class FeedsController < ApplicationController
	before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  def index
		@feedbacks = Feed.all
	end

	def new
		@feedback = Feed.new
	end

	def create
		# debugger
		@feedback = Feed.new(feed_params)
		
		if @feedback.save
			redirect_back(fallback_location: root_path)
		
		end
	end

	def show
	end

	def edit
	end

	def update
		if @feedback.update(feed_params)
			redirect_back(fallback_location: root_path)
	
		end
	end

	def destroy
		raise StandardError, "not authorized"  unless can? :destroy, @feedback
		if @feedback.nil?
			redirect_to root_path
		else
			@feedback.destroy
			redirect_back(fallback_location: root_path) 
		end
	end

	private

	def set_feedback
		@feedback = Feed.find_by(id: params[:id])
		redirect_back(fallback_location: root_path) if @feedback.nil?
	end

	def feed_params
		@obj = params.require(:feed).permit(:feedback, :house_id)
        @obj[:user_id] = current_user.id
        @obj[:name] = current_user.name
		@obj
	end
end