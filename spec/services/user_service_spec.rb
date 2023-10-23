# frozen_string_literal: true

# spec/services/user_service_spec.rb
require 'rails_helper'

RSpec.describe UserService, type: :service do
  let(:user) { create(:user) }
  it "updates the user's attributes" do
    params = ActionController::Parameters.new(user: { email: 'admin1@gmail.com', role: 'admin', name: 'admin1' })
    service = UserService.new(params, user)
    permitted_params = params.require(:user).permit(:email, :role, :name).to_h
    expect(user).to receive(:update).with(hash_including(permitted_params))
    service.update_user
    user.reload
    expect(user.email)
    expect(user.role)
    expect(user.name) == ('admin1')
  end

  it 'returns nil if the update fails' do
    params = ActionController::Parameters.new(user: { email: 'invalid_email' })
    service = UserService.new(params, user)

    allow(user).to receive(:update).and_return(false)

    expect(service.update_user).to be_nil
  end
end
