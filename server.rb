# Server
require 'eventmachine'
require 'em-websocket'
require_relative 'chat_connection'
require_relative 'chat'

EM.run do
  EM.start_server '0.0.0.0', '8080', ChatConnection
end
