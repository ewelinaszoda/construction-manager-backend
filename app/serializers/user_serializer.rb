class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :surname, :email, :phone_number
  has_many :projects, serializer: ProjectSerializer
end