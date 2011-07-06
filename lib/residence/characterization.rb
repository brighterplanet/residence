# sabshere 8/15/10 should this just be required in the emitter gem's lib/emitter.rb?
module BrighterPlanet
  module Residence
    module Characterization
      def self.included(base)
        base.characterize do
          has :zip_code
          has :urbanity
          has :ownership
          has :residence_class
          has :residents
          has :clothes_machine_use
          has :dishwasher_use
          has :air_conditioner_use
          has :refrigerator_count
          has :freezer_count
          has :lighting_efficiency
          has :floorspace_estimate
          has :floors # not used
          has :bathrooms
          has :bedrooms
          has :full_bathrooms
          has :half_bathrooms
          has :rooms
          has :acquisition
          has :retirement
          has :construction_year # TODO show year only
          has :occupation
          has :annual_fuel_oil_volume_estimate, :measures => Measurement::Volume
          has :annual_fuel_oil_cost, :measures => Measurement::Cost
          has :monthly_natural_gas_volume_estimate #:measurement_options => { :external => :therms, :internal => :joules }
          has :monthly_natural_gas_cost, :measures => Measurement::Cost
          has :monthly_electricity_use_estimate, :measures => Measurement::ElectricalEnergy
          has :monthly_electricity_cost, :measures => Measurement::Cost
          has :green_electricity#, :measures => :percentage
          has :annual_propane_volume_estimate, :measures => Measurement::Volume
          has :annual_propane_cost, :measures => Measurement::Cost
          has :annual_wood_volume_estimate, :measures => Measurement::Biomass
          has :annual_kerosene_volume_estimate, :measures => Measurement::Volume
          has :annual_coal_volume_estimate, :measures => :mass # it says volume, but it wants mass
          # has :annual_coal_cost, :measures => Measurement::Cost
        end
      end
    end
  end
end
