require 'chilkat'

class RemoteView
  attr_reader :socket

  def self.open_connection(remoteHost, remotePort, useSsl = false, maxWaitMillisec = 20000)

    @@socket = Chilkat::CkSocket.new()

    if not @@socket.UnlockComponent("Anything for 30-day trial")
      raise SocketError.new(socket.lastErrorText() + "\n")
    end

    if not @@socket.AsyncConnectStart(remoteHost, remotePort, useSsl, maxWaitMillisec)
      raise SocketError.new(@@socket.lastErrorText() + "\n")
    end

    @@socket.SleepMs(100) until @@socket.get_AsyncConnectFinished()

    if not @@socket.get_AsyncConnectSuccess()
      raise SocketError.new(@@socket.asyncConnectLog() + "\n")
    end

#  Set maximum timeouts for reading an writing (in millisec)
    @@socket.put_MaxReadIdleMs(20000)
    @@socket.put_MaxSendIdleMs(20000)
  end


  def self.send_string(the_message)
    @@socket.SendString(the_message)
  end
  #-----------------------Synchronous methods


  def self.receive_message_sync
    incoming_msg = nil
    incoming_msg = @@socket.receiveUntilMatch("-EOM-") until not incoming_msg.nil?
  end

  def self.receive_string
    response = @@socket.receiveString()
    if (response == nil)
      puts @@socket.lastErrorText() + "\n";
      exit
    end
    response
  end

  def self.send_message_sync(the_message)
    if not @@socket.SendString(the_message)
      raise SocketError.new(@@socket.lastErrorText() + "\n")
    end
    #expect handshake
    incoming_msg = nil
    incoming_msg = @@socket.receiveUntilMatch("-EOM-") until not incoming_msg.nil?
    #check quit here?
  end

  #-----------------------Asynchronous methods
  def self.message_finished_async?
    if @@socket.get_AsyncSendFinished()
      if not @@socket.get_AsyncSendSuccess() #  Did the send fail?
        raise SocketError.new(@@socket.asyncSendLog() + "\n")
      end
      true
    else
      false
    end
  end

  def self.send_message_async (the_message)
    if not @@socket.AsyncSendString(the_message)
      raise SocketError.new(@@socket.lastErrorText() + "\n")
    end
  end

  def self.close
    @@socket.Close(5000)
  end
end
