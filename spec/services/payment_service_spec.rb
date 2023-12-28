# frozen_string_literal: true

# spec/services/payment_service_spec.rb
require 'rails_helper'

RSpec.describe PaymentService do
  let(:params) { { stripeEmail: 'test@example.com', stripeToken: 'valid_token' } }
  let(:amount) { 1000 } 
  let(:house) { create(:house) } 
  describe '#service_charge' do
    it 'creates a customer and a charge using Stripe' do
     
      # allow(Stripe::Customer).to receive(:create).and_return(double(id: 'customer_id'))

      
      # allow(Stripe::Charge).to receive(:create).and_return(double(id: 'charge_id'))

      service = PaymentService.new(params, amount, house)

      expect(Stripe::Customer).to receive(:create).with(hash_including(email: params[:stripeEmail],
                                                                       source: params[:stripeToken]))
      expect(Stripe::Charge).to receive(:create).with(hash_including(customer: 'customer_id', amount: amount * 100,
                                                                     description: 'Description of your product', currency: 'usd'))

      service.service_charge

      expect(house.sold).to eq(true)
    end
  end
end
