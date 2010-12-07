require 'emitter'

module BrighterPlanet
  module Residence
    extend BrighterPlanet::Emitter
    ROOMS = [
      [:bedroom,             { :max_count => 10, :multiplier => 1    }],
      [:living_room,         { :max_count => 5,  :multiplier => 1    }],
      [:dining_room,         { :max_count => 3,  :multiplier => 1    }],
      [:kitchen,             { :max_count => 3,  :multiplier => 1    }],
      [:full_bathroom,       { :max_count => 10, :multiplier => 0.5  }],
      [:half_bathroom,       { :max_count => 10, :multiplier => 0.25 }],
      [:heated_garage_berth, { :max_count => 5,  :multiplier => 1    }],
      [:other_room,          { :max_count => 10, :multiplier => 1    }]
    ]
    def zip_code_name
      zip_code ? zip_code.name : nil
    end
    def rooms
      return nil unless ROOMS.collect {|t| t.first}.all? { |r| send r.to_s.pluralize.to_sym }
      ROOMS.map do |room|
        room_name = room[0]
        room_options = room[1]
        send(room_name.to_s.pluralize.to_sym).to_i * room_options[:multiplier]
      end.sum
    end
  end
end
