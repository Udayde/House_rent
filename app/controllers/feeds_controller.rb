class FeedsController < ApplicationController
	before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  def index
		@feedbacks = Feed.all
	end

	def new
		@feedback = Feed.new
	end

	# def create
	# 	@feedback = Feed.new(feed_params)
	# 	if @feedback.save
	# 		redirect_back(fallback_location: root_path)
	# 	else
	# 		render :new, notice: 'invalid feedback!'
	# 	end
	# end

	def show
	end

	def edit
	end

	def update
		if @feedback.update(feed_params)
			redirect_back(fallback_location: root_path)
		else
			render :edit, notice: 'invalid feedback.'
		end
	end

	def destroy
		if @feedback.nil?
			redirect_to root_path
		else
			@feedback.destroy
		end
	end

	private

	def set_feedback
		@feedback = Feed.find_by(id: params[:id])
		redirect_back(fallback_location: root_path) if @feedback.nil?
	end

	def feed_params
		params.require(:feed).permit(:name, :feedback)
	end
end