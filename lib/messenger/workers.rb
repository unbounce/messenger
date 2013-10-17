class Messenger
  module Workers

    def work(message)
      raise NotImplementedError.new('Subclass must implement work')
    end

  end
end
