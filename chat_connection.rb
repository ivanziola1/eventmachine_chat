# Conection
class ChatConnection < EventMachine::WebSocket::Connection
  attr_accessor :name
  def initialize(opts = {})
    super
    onopen { on_open }
    onmessage { |message| on_message message }
    onclose { on_close }
  end

  def on_open
  end

  def on_message(message)
    if name
      Chat.send_message_to_all message, self
    else
      self.name = message
      Chat.add_connection self
    end
  end

  def on_close
    Chat.delete_connection self
  end
end
