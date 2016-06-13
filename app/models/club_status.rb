class ClubStatus < ActiveRecord::Base
  belongs_to :club
  belongs_to :status
end
