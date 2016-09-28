class Ticket < ActiveRecord::Base
	has_many :tickets, dependent: :destroy
	belongs_to :owner, class_name: 'User'

	belongs_to :user
	belongs_to :event

	validates :comment, length: { maximum: 30 }, allow_blank: true
end
