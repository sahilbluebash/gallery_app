class Imagegallery < ApplicationRecord
    
    has_many_attached :images  #active storage
    belongs_to :user #association for unique 
    validate :acceptable_image
    validates :title, presence: true
    validates :caption, presence: true
    validates :tag_list, presence: true
    acts_as_taggable #tags
    paginates_per 4


    def acceptable_image
        if images.attached? == false
            errors.add(:images,"image must be attached")
        end
           images.each do|image|
        if !image.content_type.in?(%('image/jpeg image/png))
            errors.add(:images, 'needs to be a JPEG or PNG')
         end
            end
    end
end
