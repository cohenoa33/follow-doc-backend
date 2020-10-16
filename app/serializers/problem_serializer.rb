class ProblemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :dependent_id, :files
  has_many :comments
  belongs_to :dependent
end
