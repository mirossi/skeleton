class Image < ActiveRecord::Base
  has_attached_file :picture,
                    :storage => :dropbox,
                    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },

                    :dropbox_options => {
                        :path => proc { |style| "#{style}/#{id}_#{picture.original_filename}"},  :unique_filename => true
                    }


  validates :picture, :attachment_presence => true
  validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  validates :name, :presence =>true
  belongs_to :user


end
