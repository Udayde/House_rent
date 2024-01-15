# frozen_string_literal: true

# feed controller
class FeedsController < ApplicationController
  before_action :set_feedback, only: %i[show edit update destroy]                                                                                                          

  def index
    @feedbacks = Feed.all
  end

  def new
    @feedback = Feed.new
  end

  def create
    @feedback = Feed.new(feed_params)
    return unless @feedback.save

    redirect_back(fallback_location: root_path)
  end

  def show; end

  def edit; end

  def update
    return unless @feedback.update(feed_params)

    redirect_back(fallback_location: root_path)
  end

  def destroy
    begin
    raise StandardError, 'not authorized' unless can? :destroy, @feedback
      if @feedback.nil?
        redirect_to root_path
      else
        @feedback.destroy
        redirect_back(fallback_location: root_path)
      end

    rescue StandardError=> e
      flash[:notice] = "unauthorised"
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
