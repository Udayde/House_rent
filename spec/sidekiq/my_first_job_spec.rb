# spec/jobs/my_first_job_spec.rb

require 'rails_helper'


RSpec.describe 'MyFirstJob', type: :request do
  let(:user){create(:user)}
  it 'sends an email when performed' do
    allow(User).to receive(:find).with(user.id).and_return(user)
    allow(MyMailer).to receive_message_chain(:with, :send_email, :deliver_now)

    MyFirstJob.new.perform(user.id)

    expect(User).to have_received(:find).with(user.id)
    expect(MyMailer).to have_received(:with).with(user: user)
    expect(MyMailer.with(user: user).send_email(user)).to have_received(:deliver_now)
  end
end