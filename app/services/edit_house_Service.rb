# frozen_string_literal: true

class EditHouseService
  def initialize(house, params, user)
    @house = house
    @params = params
    @user = user
  end

  def ser(params)
    @house.profile_image.attach(params[:house][:profile_image]) if params[:house][:profile_image].present?
  end

  def service_index(q, params)
    @house = q.result(distinct: true).page(params[:page])
  end

  def service_create
    @house = House.new(house_param)
    @house.profile_image.attach(@params[:house][:profile_image])
    @house
  end

  private

  def house_param
    @res = @params.require(:house).permit(:desription, :location, :buying_price, :rental_price, :available_for, :sold)
    @res[:user_id] = @user.id
    @res
  end
end
