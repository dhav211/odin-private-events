class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :username, uniqueness: true
  validates :email, :uniqueness => {:allow_blank => true}

  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :attendees, dependent: :destroy
  has_many :attending_events, through: :attendees, source: :event
  # has_many :attended_events, foreign_key: 'event_id', class_name: 'Event'

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end
