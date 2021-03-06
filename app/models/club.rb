class Club < ActiveRecord::Base
  belongs_to :location

  has_many :club_statuses
  has_many :statuses, through: :club_statuses

  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
