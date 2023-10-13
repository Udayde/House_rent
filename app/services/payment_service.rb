# frozen_string_literal: true

class PaymentService
  def initialize(params, amount, house)
    @amount = amount
    @params = params
    @house = house
  end

  def service_charge
    customer = Stripe::Customer.create({
                                         email: @params[:stripeEmail],
                                         source: @params[:stripeToken]
                                       })

    charge = Stripe::Charge.create({
                                     customer: customer.id,
                                     amount: @amount * 100,
                                     description: 'Description of your product',
                                     currency: 'usd'
                                   })

    return unless charge

    @house.sold = true
    @house.save
  end
end
