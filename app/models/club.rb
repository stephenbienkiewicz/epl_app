class Club < ActiveRecord::Base
  belongs_to :location

  validates :name, presence: true, uniqueness: {case_sensitive: false}

end
