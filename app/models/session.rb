class Session < ApplicationRecord
    belongs_to :user
    # has_many :user_sessions
    # has_many :users, through: :user_sessions
    
    validates :title, presence: true
end
