class Status < ActiveRecord::Base
  has_many :club_statuses
  has_many :clubs, through: :club_statuses

  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
