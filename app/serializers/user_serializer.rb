class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :problems, :comments
  has_many :dependents
  # has_many :problems
  # has_many :comments

  def problems
    ActiveModel::SerializableResource.new(object.problems, each_serializer: ProblemSerializer)
  end
  def comments
    ActiveModel::SerializableResource.new(object.comments, each_serializer: CommentSerializer)
  end
end
