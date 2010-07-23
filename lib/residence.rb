module BrighterPlanet
  module Residence
    extend self

    def included(base)
      require 'cohort_scope'
      require 'falls_back_on'
      require 'falls_back_on/active_record_ext'

      require 'residence/carbon_model'
      require 'residence/characterization'
      require 'residence/data'
      require 'residence/summarization'

      base.send :include, BrighterPlanet::Residence::CarbonModel
      base.send :include, BrighterPlanet::Residence::Characterization
      base.send :include, BrighterPlanet::Residence::Data
      base.send :include, BrighterPlanet::Residence::Summarization
    end
    def residence_model
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
