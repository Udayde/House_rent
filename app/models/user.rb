class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :houses

  def admin?
    self.role=='admin'
  end

  def client?
    self.role=='user'
  end

  def moderator?
    self.role=='moderator'
  end
end
