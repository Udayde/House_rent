class MyFirstJob
  include Sidekiq::Job

  def perform(user_id)
    user = User.find(user_id)
    MyMailer.with(user: user).send_email(user).deliver_now
  end
end
# git --amend => for adding changes to commit