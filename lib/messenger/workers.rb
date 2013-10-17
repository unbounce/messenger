class Messenger
  module Workers

    def work
      raise NotImplementedError.new('Subclass must implement work')
    end

  end
end
