class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :status_open, :created_at, :updated_at, :problem_id
end
