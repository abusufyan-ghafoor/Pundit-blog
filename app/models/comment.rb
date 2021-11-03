class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user
  # after_create_commit { RenderCommentJob.perform_later self }

end
