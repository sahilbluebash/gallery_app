class Imagegallery < ApplicationRecord
    
    has_one_attached :image  #active storage
    belongs_to :user #association for unique 
    validate :acceptable_image
    validates :title, presence: true
    validates :caption, presence: true
    acts_as_taggable #tags
    paginates_per 8


    def acceptable_image
        if image.attached? == false
            errors.add(:image,"image must be attached")
        else
            acceptable_types = ["image/jpeg", "image/png"]
            unless acceptable_types.include?(image.content_type)
                errors.add(:image, "must be a JPEG or PNG")
            end
         end
    end
end
