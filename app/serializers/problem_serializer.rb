class ProblemSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description, :dependent_id, :file
  has_many :comments
  belongs_to :dependent

  def file
    object.files.map {|file| rails_blob_path(file, only_path: true)}
  end
end

