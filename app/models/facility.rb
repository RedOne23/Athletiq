class Facility < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: ["Football", "Tennis", "Swimming pool", "Event"] }
  validates :description, presence: true
  validates :name, presence: true
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
