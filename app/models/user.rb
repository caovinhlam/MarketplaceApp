class User < ApplicationRecord
    has_many :sessions, dependent: :destroy

    def full_name
        return "#{first_name} #{last_name}"
    end
end
