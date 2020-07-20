class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :surname, :email, :phone_number
end