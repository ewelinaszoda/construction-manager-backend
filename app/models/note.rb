class Note < ApplicationRecord
  belongs_to :project

  validates :title, presence: true
  validates :description, length: { maximum: 500, message: "Maximum length is 500 characters." }
end
