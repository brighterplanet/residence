require 'data_miner'

module BrighterPlanet
  module Residence
    module Data
      def self.included(base)
        base.data_miner do
          schema do
            string   'residence_class_id'
            string   'urbanity_id'
            string   'zip_code_id'
            date     'construction_year'
            boolean  'ownership'
            float    'occupation'
            integer  'residents'
            integer  'floors'
            float    'floorspace_estimate'
            string   'air_conditioner_use_id'
            string   'dishwasher_use_id'
            string   'clothes_machine_use_id'
            integer  'refrigerator_count'
            integer  'freezer_count'
            float    'lighting_efficiency'
            integer  'bedrooms'
            integer  'dining_rooms'
            integer  'living_rooms'
            integer  'kitchens'
            integer  'full_bathrooms'
            integer  'half_bathrooms'
            float    'bathrooms'
            integer  'other_rooms'
            integer  'heated_garage_berths'
            float    'annual_fuel_oil_volume_estimate'
            float    'annual_fuel_oil_cost'
            float    'monthly_natural_gas_volume_estimate'
            float    'monthly_natural_gas_cost'
            float    'monthly_electricity_use_estimate'
            float    'monthly_electricity_cost'
            float    'green_electricity'
            float    'annual_propane_volume_estimate'
            float    'annual_propane_cost'
            float    'annual_wood_volume_estimate'
            float    'annual_kerosene_volume_estimate'
            float    'annual_coal_volume_estimate'
            float    'annual_coal_cost'
            date     'acquisition'
            date     'retirement'
          end
          
          process "pull orphans" do
            ResidenceFuelType.run_data_miner!
            ResidenceFuelPrice.run_data_miner!
          end
          
          process "pull dependencies" do
            run_data_miner_on_belongs_to_associations
          end
        end
      end
    end
  end
end