class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  has_many :sessions, class_name: "Session", foreign_key: "user_id", dependent: :destroy
  has_many :user_sessions, foreign_key: "attendee_id"
  has_many :sessions, through: :user_sessions, source: :session
  
  # has_many :user_sessions
  # has_many :sessions, through: :user_sessions
 
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
      return "#{first_name} #{last_name}"
  end
end
