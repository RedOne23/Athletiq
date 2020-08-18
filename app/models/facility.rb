class Facility < ApplicationRecord
  belongs_to :user
  validates :address, presence: true, uniqueness: true
  validates :category, presence: true, uniqueness: true
  validates :description, presence: true, inclusion: { in: ["Football", "Tennis", "Swimming pool", "Event"] }
  validates :name, presence: true
end
