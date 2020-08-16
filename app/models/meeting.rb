class Meeting < ApplicationRecord
  belongs_to :project
  has_many :subcontractor_meetings
  has_many :subcontractors, through: :subcontractor_meetings

  validates :title, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :description, length: { maximum: 500, message: "can have maximum 500 characters." }
end
