class Restaurant < ActiveRecord::Base
  with_options dependent: :destroy do |assoc|
    assoc.has_one :address
    assoc.has_one :timetable
    assoc.has_many :reviews
    assoc.has_many :phone_numbers
  end
end
