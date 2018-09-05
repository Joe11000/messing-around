class ChatChannel < ApplicationCable::Channel
  def subscribed
     1 + 1
    byebug
    stream_from "chat_room"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    # unsubscribe_from
  end

  def chat
  end
end


# connection Object
