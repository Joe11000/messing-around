module ApplicationCable
  class Channel < ActionCable::Channel::Base

    def toddler_has_remote
      'better take it away from him'
    end
  end
end
