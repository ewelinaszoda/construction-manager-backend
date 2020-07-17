class Project < ApplicationRecord
  has_many :meetings
  has_many :notes
  has_many :subcontractors
  has_many :drawings
  belongs_to :user

 validates :name, presence: true
 validates :description, length: { maximum: 300, message: "Maximum length is 300 characters." }
end
