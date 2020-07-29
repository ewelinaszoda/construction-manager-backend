class Meeting < ApplicationRecord
  belongs_to :project
  has_many :subcontractor_meetings
  has_many :subcontractors, through: :subcontractor_meetings

  validates :title, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  # validate :end_time_after_start_time
  validates :description, length: { maximum: 500, message: "can have maximum 500 characters." }

  # private

#   def end_time_after_start_time
#     return if end_time.blank? || start_time.blank?

#     if end_time < start_time
#       errors.add(:end_time, "must be after the start hour")
#     end
#  end

end
