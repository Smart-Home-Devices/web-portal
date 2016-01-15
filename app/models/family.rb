class Family < ActiveRecord::Base
	validates :name, presence: true
	validates :rpi_id, presence: true, uniqueness: true
	has_many :users, dependent: :destroy
end
