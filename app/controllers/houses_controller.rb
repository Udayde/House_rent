# frozen_string_literal: true

# HousesController.
class HousesController < ApplicationController
  authorize_resource
  before_action :set_house_service
  before_action :set_house, only: %i[edit update show destroy]

  def index
    @q = House.ransack(params[:q])
    @house = @service.service_index(@q, params)
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
    @service.ser(params)
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
    @service = EditHouseService.new(@house, params, current_user)
  end

  def house_param
    @res = params.require(:house).permit(:desription, :location, :buying_price, :rental_price, :available_for, :sold)
    @res[:user_id] = current_user.id
    @res
  end

  def set_house
    @house = House.find(params[:id])
  end
end
