require 'emitter'

module BrighterPlanet
  module Residence
    extend BrighterPlanet::Emitter

    def self.residence_model
      if Object.const_defined? 'Residence'
        ::Residence
      elsif Object.const_defined? 'ResidenceRecord'
        ResidenceRecord
      else
        raise 'There is no residence model'
      end
    end
  end
end
