require 'residence'
require 'falls_back_on'

class ResidenceRecord < ActiveRecord::Base
  include Sniff::Emitter
  include BrighterPlanet::Residence
  
  def zip_code_name=(value)
    self.zip_code = ZipCode.find_by_name(value)
  end
  
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
  
  def rooms=(room_count)
    raise ArgumentError, "Can't set rooms directly" unless room_count.nil?
    update_attributes ROOMS.inject({}) { |memo, r| memo[r[0].to_s.pluralize.to_sym] = nil; memo }
  end
  
  ADJECTIVES = %w(
    alluring
    beautiful
    charming
    dignified
    elegant
    fair
    graceful
    handsome
    inimitable
    j
    k
    lovely
    magnificent
    n
    o
    pretty
    q
    resplendent
    splendid
    t
    unparalleled
    v
    well-appointed
    x
    y
    z
  )
  
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
end
