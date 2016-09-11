# Module with methods
module Chat
  CONNECTIONS = []

  module_function

  def add_connection(connection)
    CONNECTIONS.push connection
    send_message_to_all "#{connection.name} connected"
  end

  def delete_connection(connection)
    CONNECTIONS.delete connection
    send_message_to_all "#{connection.name} left the chat"
  end

  def send_message_to_all(message, user_connection = nil)
    CONNECTIONS.each do |connection|
      if user_connection
        connection.send "#{user_connection.name}: #{message}"
      else
        connection.send message
      end
    end
  end
end
