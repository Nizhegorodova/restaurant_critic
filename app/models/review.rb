class Review < ActiveRecord::Base
  acts_as_taggable_on

  belongs_to :restaurant

  with_options dependent: :destroy do |assoc|
    assoc.has_one :rating
    assoc.has_many :photos
  end
end
