# frozen_string_literal: true

# model paymentcontroller
class PaymentsController < ApplicationController
  before_action :set_amount
  def new
    @is_sold = House.find(params[:id]).sold if params[:id].present?
  end

  def create
    service = PaymentService.new(params, @amount, @house)
    charge = service.service_charge
    if charge
      redirect_to houses_path, alert: 'payment success'
    else
      redirect_to new_payment_path
    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_payment_path
  end

  private

  def set_amount
    @house = House.find(params[:id])
    @amount = if @house.available_for == 'buy'
                @house.buying_price
              else
                @house.rental_price
              end
  end
end
