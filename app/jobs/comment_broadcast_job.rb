class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform(comment, partial)
    ActionCable.server.broadcast "comment", partial
  end

  protected
  def render_comment(comment)
    CommentsController.render(partial: 'comments/comment', locals: { comment: comment } )
  end
end
