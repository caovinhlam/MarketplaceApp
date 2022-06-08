class Session < ApplicationRecord
    belongs_to :user
    belongs_to :category
    # has_many :user_sessions
    # has_many :users, through: :user_sessions
    
    validates :title, presence: true
    has_one_attached :cover
end
