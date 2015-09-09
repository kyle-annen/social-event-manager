class Event < ActiveRecord::Base
  # paperclip entries
  attr_accessor :event_pic
  has_attached_file :event_pic, styles: { large: "1200x400>", medium: "678x226>" }, default_url: "images/:style/missing.png"
  validates_attachment_content_type :event_pic, content_type: /\Aimage\/.*\Z/
  

  # active record
  belongs_to :user
  default_scope -> { order(start_date: :asc) }
  
  # validations
  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
end
