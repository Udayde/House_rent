class PaymentsController < ApplicationController
  before_action :set_amount
  def new
    @is_sold = House.find(params[:id]).sold if params[:id].present?
  end

  def create
    # debugger@ = House.find()
    customer = Stripe::Customer.create({
                                         email: params[:stripeEmail],
                                         source: params[:stripeToken]
                                       })

    charge = Stripe::Charge.create({
                                     customer: customer.id,
                                     amount: @amount * 100,
                                     description: 'Description of your product',
                                     currency: 'usd'

                                   })
    # flash[:alert]="payment sucessful"
    if charge
      @house = House.find(params[:id])
      @house.sold = true
      @house.save

      redirect_to houses_path, alert: 'payment success'
    else
      # session = Stripe::Checkout::Session.create(
      #   success_url:  payments_success_url,
      #   cancel_url: payments_cancel_url
      #  )
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

  # def payments_success_url
  #   #handle successful payments
  #   # redirect_to root_url, notice: "Purchase Successful"
  #   p 'success ----------------------'
  # end

  # def payments_cancel_url
  #   #handle if the payment is cancelled
  #   redirect_to new_payment_path, notice: "Purchase Unsuccessful"
  # end
end
