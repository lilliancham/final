class Event < ActiveRecord::Base

  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :signups, :dependent => :destroy
  has_many :attendees, :through => :signups , :source => :user

  validates :user, :presence => true
  validates :title, :presence => true
  validates :held_on, :presence => true
  validates :location, :presence => true
  validates :capacity, :presence => true


  mount_uploader :file_upload, FileUploadUploader

end
