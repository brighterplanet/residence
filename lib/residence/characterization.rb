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
          has :lighting_efficiency, :measures => :percentage
          has :floorspace_estimate, :trumps => :rooms, :measures => :area
          has :floors # not used
          has :bathrooms
          has :bedrooms
          has :full_bathrooms, :hidden => true
          has :half_bathrooms, :hidden => true
          has :rooms, :trumps => [:bathrooms, :bedrooms, :full_bathrooms, :half_bathrooms]
          has :acquisition
          has :retirement
          has :construction_year # TODO show year only
          has :occupation, :measures => :percentage
          has :annual_fuel_oil_volume_estimate, :trumps => :annual_fuel_oil_cost, :measures => :volume
          has :annual_fuel_oil_cost, :trumps => :annual_fuel_oil_volume_estimate, :measures => :cost
          has :monthly_natural_gas_volume_estimate, :trumps => :monthly_natural_gas_cost, :measurement_options => { :external => :therms, :internal => :joules }
          has :monthly_natural_gas_cost, :trumps => :monthly_natural_gas_volume_estimate, :measures => :cost
          has :monthly_electricity_use_estimate, :trumps => :monthly_electricity_cost, :measures => :electrical_energy
          has :monthly_electricity_cost, :trumps => :monthly_electricity_use_estimate, :measures => :cost
          has :green_electricity, :measures => :percentage
          has :annual_propane_volume_estimate, :trumps => :annual_propane_cost, :measures => :volume
          has :annual_propane_cost, :trumps => :annual_propane_volume_estimate, :measures => :cost
          has :annual_wood_volume_estimate, :measures => :biomass
          has :annual_kerosene_volume_estimate, :trumps => :annual_kerosene_cost, :measures => :volume
          has :annual_coal_volume_estimate, :trumps => :annual_coal_cost, :measures => :mass # it says volume, but it wants mass
          # has :annual_coal_cost, :trumps => :annual_coal_volume_estimate, :measures => :cost
        end
      end
    end
  end
end
