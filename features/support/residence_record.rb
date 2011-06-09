require 'residence'
require 'falls_back_on'

class ResidenceRecord < ActiveRecord::Base
  include Sniff::Emitter
  include BrighterPlanet::Residence
  def zip_code_name=(value)
    self.zip_code = ZipCode.find_by_name(value)
  end
  def rooms=(room_count)
    raise ArgumentError, "Can't set rooms directly" unless room_count.nil?
    update_attributes ROOMS.inject({}) { |memo, r| memo[r[0].to_s.pluralize.to_sym] = nil; memo }
  end
end
