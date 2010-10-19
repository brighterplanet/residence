module BrighterPlanet
  module Residence
    module Fallback
      def self.included(target)
        target.falls_back_on :annual_fuel_oil_volume_estimate => 52.59.gallons.to(:litres), # https://brighterplanet.sifterapp.com/projects/30/issues/435
                      :monthly_natural_gas_volume_estimate => (404.56508697 / 12).therms.to(:joules), # https://brighterplanet.sifterapp.com/projects/30/issues/435
                      :annual_propane_volume_estimate => 48.41.gallons.to(:litres), # https://brighterplanet.sifterapp.com/projects/30/issues/435
                      :annual_wood_volume_estimate => 0.18.cords.to(:joules), # https://brighterplanet.sifterapp.com/projects/30/issues/435
                      :annual_kerosene_volume_estimate => 1.07.gallons.to(:litres), # https://brighterplanet.sifterapp.com/projects/30/issues/435
                      :annual_coal_volume_estimate => (6.33 / 2000).tons.to(:kilograms), # https://brighterplanet.sifterapp.com/projects/30/issues/435
                      :monthly_electricity_use_estimate => 10752.83 / 12, # kWh https://brighterplanet.sifterapp.com/projects/30/issues/435
                      :residents => 2.57, # people https://brighterplanet.sifterapp.com/projects/30/issues/436
                      :floorspace_estimate => 2308.61.square_feet.to(:square_metres), # https://brighterplanet.sifterapp.com/projects/30/issues/436
                      :occupation => 0.937, # https://brighterplanet.sifterapp.com/projects/30/issues/434
                      :green_electricity => 0.0 # crap placeholder for now
      end
    end
  end
end
