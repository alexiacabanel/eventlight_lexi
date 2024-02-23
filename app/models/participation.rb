class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :evenement

  validates :user, uniqueness: { scope: :event }
end
