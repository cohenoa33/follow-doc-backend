class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :problems, :comments, :appointments, :doctors
  # , :appointments, :doctors
  has_many :dependents
  # has_many :problems
  # has_many :comments

  def problems
    ActiveModel::SerializableResource.new(object.problems, each_serializer: ProblemSerializer)
  end
  def comments
    ActiveModel::SerializableResource.new(object.comments, each_serializer: CommentSerializer)
  end
  def appointments
    ActiveModel::SerializableResource.new(object.appointments, each_serializer: AppointmentSerializer)
  end
  def doctors
    ActiveModel::SerializableResource.new(object.doctors, each_serializer: DoctorSerializer)
  end
end
