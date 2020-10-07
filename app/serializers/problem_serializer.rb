class ProblemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :dependent_id

  has_many :comments
end
