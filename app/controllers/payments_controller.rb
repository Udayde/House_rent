class PaymentsController < ApplicationController
    def new
      @amount = House.find_by(id: params[:id]).rental_price
    end
    
    def create
      #debugger
      customer = Stripe::Customer.create({
        :email => params[:stripeEmail],
        :source => params[:stripeToken]
      })
   
      
      charge = Stripe::Charge.create({
        :customer => customer.id,
        :amount => (House.find(params[:id]).rental_price)*100,
        :description => 'Description of your product',
        :currency => 'usd'
      })
      if charge
        
        flash[:alert]="payment sucessful"
      end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_payment_path
    end
  
end
