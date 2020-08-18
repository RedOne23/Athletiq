class Facility < ApplicationRecord
  belongs_to :user
  validates :address, presence: true, uniqueness: true
  validates :category, presence: true, inclusion: { in: ["Football", "Tennis", "Swimming pool", "Event"] }
  validates :description, presence: true
  validates :name, presence: true
  has_one_attached :photo
end
