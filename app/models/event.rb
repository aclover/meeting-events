class Event < ApplicationRecord
  belongs_to :user
  has_many :attendings
	has_many :users_attendings, through: :attendings, source: :user
  has_many :comments
  validates :name, :location, :state, :date,  presence:true
end
