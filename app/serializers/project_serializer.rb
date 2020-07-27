class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :image, :description, :client, :project_manager, :site_manager, :quantity_surveyor, :start_date, :end_date
  has_many :notes
  has_many :meetings
end
