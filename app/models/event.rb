class Event < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(start_date: :asc) }
  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
end
