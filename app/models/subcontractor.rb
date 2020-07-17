class Subcontractor < ApplicationRecord
  belongs_to :project
  has_many :subcontractor_meetings
  has_many :meetings, through: :subcontractor_meetings

  validates :name, presence: true
  validates :description, length: { maximum: 150, message: "Maximum length is 150 characters." }
end
