class Review < ApplicationRecord
  belongs_to :facility
  validates :content, presence: true
end
