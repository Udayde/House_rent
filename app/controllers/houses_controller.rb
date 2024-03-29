# frozen_string_literal: true

# HousesController.
class HousesController < ApplicationController
  authorize_resource
  before_action :set_house, only: %i[edit update show destroy]
  before_action :set_house_service
 
  def index
    @q = House.ransack(params[:q])
    # @houses = @service.service_index(@q, params)
    # debugger
    @houses = @service.service_index(@q)
  end

  def new
    @house = House.new
  end

  def create
    @house = @service.service_create
    if @house.save
      flash[:notice] = 'success registeration!'
      redirect_to houses_path
    else
      render :new
    end
  end

  def edit; end

  def update
    # @service.ser(params)
    @service.service_update
    return unless @house.update(house_param) 
    flash[:notice] = 'success update!'
    redirect_to houses_path
  end

  def destroy
    @house.destroy
    flash[:notice] = 'deleted sucessfully'
    redirect_to houses_path
  end

  def show
    @feed = Feed.new
    @feedbacks = @house.feeds
  end

  private

  def set_house_service
    # debugger
    @service = HouseService.new(@house, params, current_user)
  end

  def house_param
    @res = params.require(:house).permit(:desription, :location, :buying_price, :rental_price, :profile_image, :available_for, :sold)
    @res[:user_id] = current_user.id
    @res
   
  end

  def set_house
    # debugger
    @house = House.find(params[:id])
  end
end
