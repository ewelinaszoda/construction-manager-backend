class SubcontractorMeeting < ApplicationRecord
  belongs_to :meeting
  belongs_to :subcontractor
end
