class Image < ActiveRecord::Base
  has_attached_file :picture,
                    :storage => :dropbox,
                    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },

                    :dropbox_options => {
                      :path => proc { |style| "#{PAPERCLIP_CONFIG['subpath']}/#{style}/#{id}_#{picture.original_filename}"},  :unique_filename => true
                    }


  validates :picture, :attachment_presence => true
  validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  belongs_to :user

  has_one :wine_has_image
  has_one :wine, through: :wine_has_image
  accepts_nested_attributes_for :wine

  def get_url_org
    if self.org_file.nil?
      self.org_file= self.picture.url(:original) if  !picture.nil?
      self.save
    end
    return  self.org_file
  end

  def get_url_med
    if self.med_file.nil?
      self.med_file= self.picture.url(:medium) if  !picture.nil?
      self.save
    end
    return  self.med_file
  end
  
   def get_url_thumb
    if self.thumb_file.nil?
      self.thumb_file= self.picture.url(:thumb) if  !picture.nil?
      self.save
    end
    return  self.thumb_file
  end

end
