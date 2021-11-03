class CommentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "comment"
  end

  def receive(data)
      # Rebroadcast a message sent by one client to any other connected clients
      # ActionCable.server.broadcast(project, data)
    end

    def unsubscribed
      # Any cleanup needed when channel is unsubscribed
      # stop_all_streams() -> Unsubscribes all streams associated with this channel from the pubsub queue
    end
end
