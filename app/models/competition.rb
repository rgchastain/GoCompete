class Competition < ActiveRecord::Base
  belongs_to :user
  has_many :messages
  has_many :competes
  has_many :competidors, through: :competes, source: :user
end
