class User < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :meetings, through: :projects
  has_many :notes, through: :projects
  has_many :subcontractors, through: :projects
  has_many :drawings, through: :projects
  has_secure_password

  validates :name, presence: true
  validates :surname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end

