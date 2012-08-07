require 'earth/residence/air_conditioner_use'
require 'earth/residence/clothes_machine_use'
require 'earth/residence/dishwasher_use'
require 'earth/residence/residence_class'
require 'earth/residence/urbanity'
require 'earth/locality/zip_code'

module BrighterPlanet
  module Residence
    module Relationships
      def self.included(target)
        target.belongs_to :residence_class
        target.belongs_to :urbanity
        target.belongs_to :dishwasher_use
        target.belongs_to :air_conditioner_use
        target.belongs_to :clothes_machine_use
        target.belongs_to :zip_code
      end
    end
  end
end
