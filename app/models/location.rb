class Location < ActiveRecord::Base
  has_many :clubs

  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
