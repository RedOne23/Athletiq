class Facility < ApplicationRecord
  belongs_to :user
  validates :address, presence: true, uniqueness: true
  validates :category, presence: true, uniqueness: true
  validates :description, presence: true
  validates :name, presence: true
end
