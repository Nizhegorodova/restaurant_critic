class Photo < ActiveRecord::Base
  belongs_to :review
  has_attached_file :image
end
