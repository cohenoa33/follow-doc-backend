class Comment < ApplicationRecord
  belongs_to :problem

  def created_at
    attributes['created_at'].strftime('%m/%d/%Y %I:%M %p')
  end
end
