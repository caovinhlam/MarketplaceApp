class UserSession < ApplicationRecord
  belongs_to :attendee, class_name: "User"
  belongs_to :session
end
