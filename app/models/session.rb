class Session < ApplicationRecord
    belongs_to :user, class_name: "User"
    belongs_to :category
    has_many :user_sessions
    has_many :attendees, through: :user_sessions
    
    validates :title, presence: true
    has_one_attached :cover
end
