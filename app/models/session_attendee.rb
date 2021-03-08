class SessionAttendee < ApplicationRecord
  belongs_to :student
  belongs_to :session
end
