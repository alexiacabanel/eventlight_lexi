class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    after_create :welcome_send
    has_many :participations
    has_many :evenements, through: :participations
    has_many :administered_evenements, class_name: 'Event', foreign_key: 'admin_id'

    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end
end
