class Song < ActiveRecord::Base
validates :title, presence: true, uniqueness: true
 validates :released, inclusion: { in: [ true, false ] }
 validates :released_year, presence: true, if: :has_been_released?
 validate :check_release_year
 validates :artist_name, presence: true

 def has_been_released?
   record.released == true
 end

 def check_release_year
   self.released_year <= Time.new.year
 end
end
