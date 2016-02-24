class Family < ActiveRecord::Base
	validates :name, presence: true
	validates :rpi_id, presence: true, :uniqueness => {:case_sensitive => false}
	has_many :users, dependent: :destroy
	has_many :devices, dependent: :destroy
	has_many :sensors, dependent: :destroy
end
