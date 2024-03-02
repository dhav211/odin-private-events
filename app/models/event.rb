class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendees, dependent: :destroy
  has_many :attending_users, through: :attendees, source: :user

  scope :upcoming, -> { where('date > ?', Time.now) }
  scope :past, -> { where('date < ?', Time.now) }
  scope :has_attendees, -> { joins(:attending_users) }
end
