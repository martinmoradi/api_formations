class Session < ApplicationRecord
  belongs_to :classroom
  belongs_to :course
end
