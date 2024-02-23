class Evenement < ApplicationRecord
  has_many :participations
  has_many :participants, through: :participations, source: :user
  belongs_to :admin, class_name: 'User'

  validates :start_date, presence: true
  validate :start_date_cannot_be_in_the_past
  validates :duration, presence: true
  validate :duration_must_be_valid
  validates :title, presence: true, length: { in: 4..139 }
  validates :description, presence: true, length: { in: 19..999 }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :location, presence: true

  def duration_must_be_valid
    return unless duration.nil? || duration <= 0 || duration % 5 != 0

    errors.add(:duration, 'must be greater than 0 and a multiple of 5')
  end

  def start_date_cannot_be_in_the_past
    return unless start_date.present? && start_date < Date.today

    errors.add(:start_date,
               'Veuillez sélectionner une date à venir.')
  end
end
